/* 26241 */
#include <stdio.h>
#include "euler.h"

#define N 10

int main(int argc, char **argv)
{
    int v;
    int i = 3;
    int p = 3;
    int n = 5;

    while (p * 100 / n >= 10)
    {
        i += 2;
        v = i * i;
        if (is_prime(v - (i -1)))
            p += 1;
        if (is_prime(v - (i -1) * 2))
            p += 1;
        if (is_prime(v - (i -1) * 3))
            p += 1;
        n += 4;
    }
    printf("%d\n", i);
    return 0;
}
