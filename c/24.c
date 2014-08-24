/* 2783915460 */
#include <stdio.h>

#define N 1000000

int main(int argc, char **argv)
{
    int n;
    int f = 1;
    for (n = 1; n < 10; n++)
        f *= n;

    int x, i;
    int v = N - 1;
    char d[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    for (n = 0; n < 10; n++)
    {
        x = v / f;
        v %= f;
        if (n != 9)
            f /= 10 - n - 1;
        printf("%c", d[x]);
        for (i = x; i < 9; i++)
            d[i] = d[i + 1];
    }
    printf("\n");
    return 0;
}
