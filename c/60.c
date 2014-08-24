/* 26033 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tree.h"
#include "euler.h"

#define N 5
#define M 10000
#define X 250

struct tuple
{
    RB_ENTRY(tuple) next;
    int sz;
    int n[N];
    int x[X];
};
RB_HEAD(tuple_list, tuple);

int cmp_tuple(struct tuple *a, struct tuple *b)
{
    return memcmp(a->n, b->n, sizeof(a->n));
}

RB_GENERATE(tuple_list, tuple, next, cmp_tuple);

int main(int argc, char **argv)
{
    int np;
    char *sieve;
    int *primes;
    np = prime_sieve(M, &sieve, &primes);
    free(sieve);

    int i, j;
    char s[9];
    struct tuple v, *t;
    struct tuple_list pset = RB_INITIALIZER(&pset);
    for (i = 0; i < np; i++)
    {
        for (j = i+1; j < np; j++)
        {
            sprintf(s, "%d%d", primes[i], primes[j]);
            if (!is_prime(atoi(s)))
                continue;
            sprintf(s, "%d%d", primes[j], primes[i]);
            if (is_prime(atoi(s)))
            {
                v.n[0] = primes[i];
                t = RB_FIND(tuple_list, &pset, &v);
                if (t == NULL)
                {
                    t = calloc(1, sizeof(*t));
                    t->n[0] = primes[i];
                    t->sz = 0;
                    RB_INSERT(tuple_list, &pset, t);
                }
                t->x[t->sz++] = primes[j];
            }
        }
    }

    struct tuple vv, *tt;
    int k, ii, found, inside, n = 2;
    struct tuple_list cset = RB_INITIALIZER(&pset);
    while (n < 5)
    {
        RB_FOREACH(tt, tuple_list, &pset)
        {
            for (i = 0; i < tt->sz; i++)
            {
                for (j = i+1; j < tt->sz; j++)
                {
                    found = 1;
                    memcpy(v.n, tt->n, sizeof(tt->n));
                    v.n[n-1] = tt->x[i];
                    for (k = 0; k < n; k++)
                    {
                        memcpy(vv.n, v.n, k * sizeof(v.n[0]));
                        memcpy(vv.n + k, v.n + k + 1,
                                (N - k - 1) * sizeof(v.n[0]));

                        t = RB_FIND(tuple_list, &pset, &vv);
                        if (t == NULL)
                        {
                            found = 0;
                            break;
                        }

                        inside = 0;
                        for (ii = 0; ii < t->sz; ii++)
                        {
                            if (t->x[ii] == tt->x[j])
                            {
                                inside = 1;
                                break;
                            }
                        }
                        if (!inside)
                        {
                            found = 0;
                            break;
                        }
                    }

                    if (found)
                    {
                        t = RB_FIND(tuple_list, &cset, &v);
                        if (t == NULL)
                        {
                            t = calloc(1, sizeof(*t));
                            memcpy(t->n, v.n, sizeof(v.n));
                            t->sz = 0;
                            RB_INSERT(tuple_list, &cset, t);
                        }
                        t->x[t->sz++] = tt->x[j];
                    }
                }
            }
        }

        while (!RB_EMPTY(&pset))
        {
            t = RB_MIN(tuple_list, &pset);
            RB_REMOVE(tuple_list, &pset, t);
            free(t);
        }
        while (!RB_EMPTY(&cset))
        {
            t = RB_MIN(tuple_list, &cset);
            RB_REMOVE(tuple_list, &cset, t);
            RB_INSERT(tuple_list, &pset, t);
        }
        n++;
    }

    n = 0;
    while (!RB_EMPTY(&pset))
    {
        t = RB_MIN(tuple_list, &pset);
        RB_REMOVE(tuple_list, &pset, t);
        k = t->x[0];
        for (i = 0; i < N-1; i++)
            k += t->n[i];
        if (n == 0 || k < n)
            n = k;
        free(t);
    }
    printf("%d\n", n);
    return 0;
}
