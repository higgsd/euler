/* 872187 */
#include <string.h>
#include <stdio.h>

#define N 1000000

int palinbase(int n, int b)
{
    int i, sz = 0;
    char s1[21] = {0};
    char s2[21] = {0};
    while (n > 0)
    {
        s1[sz++] = (n % b) + '0';
        n /= b;
    }
    for (i = 0; i < sz; i++)
        s2[sz - i - 1] = s1[i];
    return (strcmp(s1, s2) == 0);
}

int main(int argc, char **argv)
{
    int n, s = 0;
    for (n = 1; n < N; n += 2)
        if (palinbase(n, 10) && palinbase(n, 2))
            s += n;
    printf("%d\n", s);
    return 0;
}
