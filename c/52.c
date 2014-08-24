/* 142857 */
#include <stdio.h>
#include "euler.h"

#define N 6

int ipow(int a, int b)
{
    int s = 1;
    while (b--)
        s *= a;
    return s;
}

int main(int argc, char **argv)
{
    int d = 1;
    int n, nn, i, found;
    while (1)
    {
        for (n = ipow(10, d); n < 2 * ipow(10, d); n++)
        {
            found = 1;
            nn = digit_usage(n, 0);
            for (i = 2; i <= N; i++)
            {
                if (nn != digit_usage(n * i, 0))
                {
                    found = 0;
                    break;
                }
            }
            if (found)
            {
                printf("%d\n", n);
                return 0;
            }
        }
        d++;
    }
    return 0;
}
