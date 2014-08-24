/* 5482660 */
#include <stdio.h>
#include "euler.h"

#define N 10000

int main(int argc, char **argv)
{
    int i, j;
    int p[N] = {0};

    i = 1;
    while (1)
    {
        p[i] = i * (3 * i - 1) / 2;
        if (p[i] % 2 == 0)
        {
            j = 1;
            while (j < i)
            {
                if (p[j] % 2 == 0 && is_pentagonal(p[i] - p[j]) &&
                        is_pentagonal(p[i] + p[j]))
                {
                    printf("%d\n", p[i] - p[j]);
                    return 0;
                }
                j++;
            }
        }
        i++;
    }
    return 0;
}
