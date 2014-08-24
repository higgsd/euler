/* 7652413 */
#include <stdio.h>
#include "euler.h"

#define N 7

int main(int argc, char **argv)
{
    char d[N], v[N];
    int m = 0;
    int f, i, ii, j, k, vv;

    f = 1;
    for (i = 1; i <= N; i++)
        f *= i;
    for (i = 0; i < f; i++)
    {
        for (j = 0; j < N; j++)
            d[j] = j + 1;

        ii = i;
        for (j = 0; j < N; j++)
        {
            k = ii % (N - j);
            v[j] = d[k];
            ii /= N - j;
            for (; k < N - 1; k++)
                d[k] = d[k+1];
        }

        vv = 0;
        for (j = 0, k = 1; j < N; j++, k *= 10)
            vv += v[j] * k;
        if (is_prime(vv) && vv > m)
            m = vv;
    }
    printf("%d\n", m);
    return 0;
}
