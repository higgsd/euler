/* 40730 */
#include <stdio.h>

int main(int argc, char **argv)
{
    int n, nn, s, ss = 0;
    int f[10] = {0};

    f[0] = 1;
    for (n = 1; n < 10; n++)
        f[n] = n * f[n-1];

    ss = 0;
    for (n = 10; n < 7 * f[9]; n++)
    {
        s = 0;
        nn = n;
        while (nn != 0)
        {
            s += f[nn % 10];
            nn /= 10;
        }
        if (s == n)
            ss += n;
    }
    printf("%d\n", ss);
    return 0;
}
