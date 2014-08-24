/* 983 */
#include <string.h>
#include <stdio.h>

#define N 1000

int main(int argc, char **argv)
{
    int p[N];
    int n, d, r;
    int mn = 0, md = 0;
    for (n = 2; n < N; n++)
    {
        d = r = 1;
        memset(p, 0, n * sizeof(int));
        while (r != 0 && p[r] == 0)
        {
            p[r] = d++;
            r = (r * 10) % n;
        }
        if (r == 0)
            d--;
        if (d - p[r] > md)
        {
            md = d - p[r];
            mn = n;
        }
    }
    printf("%d\n", mn);
    return 0;
}
