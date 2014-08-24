/* 142913828922 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define N 2000000

int main(int argc, char **argv)
{
    int i, np;
    char *sieve;
    int *primes;
    long long s = 0;

    np = prime_sieve(N, &sieve, &primes);
    for (i = 0; i < np; i++)
        s += primes[i];
    printf("%lld\n", s);
    free(sieve);
    free(primes);
    return 0;
}
