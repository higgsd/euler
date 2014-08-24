/* 1533776805 */
#include <stdio.h>
#include "euler.h"

int main(int argc, char **argv)
{
    int h, n = 144;
    while (1)
    {
        h = n * (2 * n - 1);
        if (is_pentagonal(h) && is_triangular(h))
        {
            printf("%d\n", h);
            break;
        }
        n++;
    }
    return 0;
}
