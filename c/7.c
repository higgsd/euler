/* 104743 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define N 10001
#define M 200000

int main(int argc, char **argv)
{
    char *sieve;
    int *primes;
    prime_sieve(M, &sieve, &primes);
    printf("%d\n", primes[N-1]);
    free(sieve);
    free(primes);
    return 0;
}
