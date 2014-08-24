/* 296962999629 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define D 4
#define N 10000
#define S 3330

int main(int argc, char **argv)
{
    char *sieve;
    int a, aa, b, c;
    prime_sieve(N, &sieve, NULL);
    for (a = N/10+1; a < N; a += 2)
    {
        b = a + S;
        c = b + S;
        if (a != 1487 && sieve[a] && sieve[b] && sieve[c])
        {
            aa = digit_usage(a, 0);
            if (aa == digit_usage(b, 0) && aa == digit_usage(c, 0))
            {
                printf("%d%d%d\n", a, b, c);
                free(sieve);
                return 0;
            }
        }
    }
    return 0;
}
