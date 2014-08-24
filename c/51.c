/* 121313 */
#include <stdio.h>
#include <stdlib.h>
#include "tree.h"
#include "euler.h"

#define N 8
#define D 6
#define M ipow(10, D)

struct mprime
{
    RB_ENTRY(mprime) next;
    int m;
    int n;
    int c;
};
RB_HEAD(mprime_list, mprime);

int cmp_mprime(struct mprime *a, struct mprime *b)
{
    return a->m - b->m;
}

RB_GENERATE(mprime_list, mprime, next, cmp_mprime);

int ipow(int a, int b)
{
    int s = 1;
    while (b--)
        s *= a;
    return s;
}

int digit_mask(int m, int p, int *mp)
{
    int pd, kd = -1, d = 1, pp = p;
    while (p > 0)
    {
        if (m & 1)
        {
            pd = p % 10;
            if (kd >= 0 && pd != kd)
                return 0;
            pp -= pd * d;
            kd = pd;
        }
        d *= 10;
        p /= 10;
        m /= 2;
    }
    *mp = pp;
    return 1;
}

int main(int argc, char **argv)
{
    char *sieve;
    int *primes, *dprimes;

    struct mprime v, *vv;
    struct mprime_list mprimes;

    int d = 5;
    int mv = 0;
    int i, m;
    RB_INIT(&mprimes);
    prime_sieve(M * 2, &sieve, &primes);
    while (mv == 0)
    {
        dprimes = primes;
        while (dprimes[0] < ipow(10, d-1))
            dprimes++;

        for (m = 1; m < ipow(2, d) - 1; m++)
        {
            for (i = 0; dprimes[i] < ipow(10, d); i++)
            {
                if (digit_mask(m, dprimes[i], &v.m))
                {
                    v.n = dprimes[i];
                    if ((vv = RB_FIND(mprime_list, &mprimes, &v)) == NULL)
                    {
                        vv = malloc(sizeof(v));
                        vv->m = v.m;
                        vv->n = v.n;
                        vv->c = 1;
                        RB_INSERT(mprime_list, &mprimes, vv);
                    }
                    else
                    {
                        vv->c++;
                    }
                }
            }

            while (!RB_EMPTY(&mprimes))
            {
                vv = RB_MIN(mprime_list, &mprimes);
                if (vv->c == N && (mv == 0 || mv > vv->n))
                    mv = vv->n;
                RB_REMOVE(mprime_list, &mprimes, vv);
                free(vv);
            }
        }
        d++;
    }
    printf("%d\n", mv);

    free(sieve);
    free(primes);
    return 0;
}
