/* 16695334890 */
#include <math.h>
#include <stdio.h>
#include "euler.h"

int main(int argc, char **argv)
{
    long long s = 0;
    double hd;
    int aa, dd, gg, hh;
    int a, b, c, d, e, f, g;
    long long n;

    for (a = 1; a < 999/17; a++)
    {
        aa = digit_usage(a * 17, 3);
        for (b = 1; b < 999/13; b++)
        {
            if ((a * 17) / 10 != (b * 13) % 100)
                continue;
            for (c = 1; c < 999/11; c++)
            {
                if ((b * 13) / 10 != (c * 11) % 100)
                    continue;
                for (d = 1; d < 999/7; d++)
                {
                    if ((c * 11) / 10 != (d * 7) % 100)
                        continue;
                    dd = digit_usage(d * 7, 3);
                    if ((aa & dd) != 0)
                        continue;
                    for (e = 1; e < 999/5; e++)
                    {
                        if ((d * 7) / 10 != (e * 5) % 100)
                            continue;
                        for (f = 1; f < 999/3; f++)
                        {
                            if ((e * 5) / 10 != (f * 3) % 100)
                                continue;
                            for (g = 1; g < 999/2; g++)
                            {
                                if ((f * 3) / 10 != (g * 2) % 100)
                                    continue;
                                gg = digit_usage(g * 2, 3);
                                if ((aa & gg) != 0 || (dd & gg) != 0)
                                    continue;
                                hh = (aa | dd | gg) ^ 0x3ff;
                                hd = log2(hh);
                                if (hd != floor(hd))
                                    continue;
                                n = (long long)hd * 1000000000LL;
                                n += g * 2000000 + d * 7000 + a * 17;
                                s += n;
                            }
                        }
                    }
                }
            }
        }
    }
    printf("%lld\n", s);
    return 0;
}
