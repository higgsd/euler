/* 100 */
#include <math.h>
#include <stdio.h>
#include "euler.h"

#define N 100

int main(int argc, char **argv)
{
    double cc, n2, d2;
    int n, nn, d, dd, c;
    int np = 1, dp = 1;
    for (n = N/10; n < N; n++)
    {
        for (d = n + 1; d < N; d++)
        {
            nn = digit_usage(n, 0);
            dd = digit_usage(d, 0);
            c = nn & dd;
            if (c == 0 || c == 1 || (nn ^ c) == 0 || (dd ^ c) == 0)
                continue;
            cc = log2(c);
            if (cc != floor(cc))
                continue;
            n2 = log2(nn ^ c);
            d2 = log2(dd ^ c);
            if ((double)n / d == n2 / d2)
            {
                np *= n;
                dp *= d;
            }
        }
    }

    n = 2;
    while (n < sqrt(dp))
    {
        while (np % n == 0 && dp % n == 0)
        {
            np /= n;
            dp /= n;
        }
        n++;
    }
    printf("%d\n", dp);
    return 0;
}
