/* 76576500 */
#include <stdio.h>
#include "euler.h"

int main(int argc, char **argv)
{
    int i = 1, n = 1;
    while (count_factors(n) <= 500)
    {
        i++;
        n += i;
    }
    printf("%d\n", n);
    return 0;
}
