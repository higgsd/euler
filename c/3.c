/* 6857 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define N 600851475143LL

int main(int argc, char **argv)
{
    int i, np;
    char *sieve;
    int *primes;

    np = prime_sieve(sqrt(N), &sieve, &primes);
    for (i = np - 1; i > 0 ; i--)
    {
        if (N % primes[i] == 0)
        {
            printf("%d\n", primes[i]);
            break;
        }
    }
    free(sieve);
    free(primes);
    return 0;
}
