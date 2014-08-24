/* 997651 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define N 1000000

int main(int argc, char **argv)
{
    char *sieve;
    int *primes;
    int n, p, i, j, m = 0;
    int np = prime_sieve(N, &sieve, &primes);
    for (n = 2; n <= np; n++)
    {
        if (n % 2 == 0)
        {
            p = 0;
            for (i = 0; i < n; i++)
                p += primes[i];
            if (p >= N)
                break;
            if (sieve[p])
                m = p;
        }
        else
        {
            for (i = 1; i < np - n; i++)
            {
                p = 0;
                for (j = i; j < i + n; j++)
                    p += primes[j];
                if (p >= N)
                    break;
                if (sieve[p])
                    m = p;
            }
        }
    }
    printf("%d\n", m);
    free(sieve);
    free(primes);
    return 0;
}
