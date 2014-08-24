/* 134043 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define N 4
#define M 200000

int main(int argc, char **argv)
{
    int n, i, found;
    char *sieve = nfactor_sieve(M);
    for (n = 646; n < M - N; n++)
    {
        found = 1;
        for (i = 0; i < N; i++)
        {
            if (sieve[n+i] != N)
            {
                found = 0;
                break;
            }
        }
        if (found)
        {
            printf("%d\n", n);
            break;
        }
    }
    free(sieve);
    return 0;
}
