/* -59231 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define N 1000
#define M 80
#define V (M * M + M * N + N)

int main(int argc, char **argv)
{
    char *sieve;
    int a, b, c, n;
    int m = -1, ab = 0;
    prime_sieve(V, &sieve, NULL);
    for (a = 1 - N; a < N; a++)
    {
        for (b = 2; b < N; b++)
        {
            n = 0;
            c = b;
            while (c > 0 && sieve[c])
            {
                n++;
                c = n * n + a * n + b;
            }
            if (n > m)
            {
                m = n;
                ab = a * b;
            }
        }
    }
    printf("%d\n", ab);
    free(sieve);
    return 0;
}
