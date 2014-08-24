/* 45228 */
#include <stdio.h>
#include "euler.h"

#define N 10000

int main(int argc, char **argv)
{
    char p[N] = {0};
    int a, aa, b, bb, c, cc, s = 0;

    for (a = 1; a < N; a++)
    {
        for (b = a + 1; b < N / a + 1; b++)
        {
            c = a * b;
            aa = digit_usage(a, 0);
            bb = digit_usage(b, 0);
            cc = digit_usage(c, 0);
            if ((aa & bb & cc) == 0 && (aa | bb | cc) == 0x3fe)
            {
                if (!p[c])
                    s += c;
                p[c] = 1;
            }
        }
    }
    printf("%d\n", s);
    return 0;
}
