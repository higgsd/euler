/* 5777 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define N 10000

int main(int argc, char **argv)
{
    char *sieve;
    int c, s, s2;
    prime_sieve(N, &sieve, NULL);
    for (c = 9; c < N; c += 2)
    {
        if (sieve[c])
            continue;
        s = 1;
        while (1)
        {
            s2 = 2 * s * s;
            if (s2 > c)
            {
                printf("%d\n", c);
                return 0;
            }
            if (sieve[c - s2])
                break;
            s++;
        }
    }
    return 0;
}
