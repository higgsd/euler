/* 4179871 */
#include <stdio.h>
#include <stdlib.h>
#include "euler.h"

#define A 12
#define B 28123

int main(int argc, char **argv)
{
    int nf, *f;
    int n, i, s;
    int na = 0;
    int ab[B] = {0};
    char abab[B] = {0};

    for (n = A; n <= B; n++)
    {
        s = 0;
        nf = all_factors(n, &f);
        for (i = 0; i < nf - 1; i++)
            s += f[i];
        free(f);
        if (s > n)
        {
            ab[na++] = n;
            for (i = 0; i < na && ab[i] + n <= B; i++)
                abab[ab[i] + n - 1] = 1;
        }
    }

    s = 0;
    for (n = 1; n <= B; n++)
        if (!abab[n-1])
            s += n;
    printf("%d\n", s);
    return 0;
}
