/* 55 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "euler.h"

#define N 1000000

int main(int argc, char **argv)
{
    int np;
    char *sieve;
    int *primes;
    np = prime_sieve(N, &sieve, &primes);

    char str[7];
    int cp, ncp = 0;
    int i, j, k, d, s, len;
    for (i = 0; i < np; i++)
    {
        sprintf(str, "%d", primes[i]);
        len = strlen(str);
        cp = 1;
        for (j = 1; j < len && cp; j++)
        {
            s = 0;
            for (k = 0, d = 1; k < len; k++, d *= 10)
                s += (str[len - 1 - (j + k) % len] - '0') * d;
            if (!sieve[s])
                cp = 0;
        }
        if (cp)
            ncp++;
    }
    printf("%d\n", ncp);
    free(sieve);
    free(primes);
    return 0;
}
