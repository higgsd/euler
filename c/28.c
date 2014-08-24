/* 669171001 */
#include <stdio.h>

#define N 1001

int main(int argc, char **argv)
{
    int n, s = 1;
    for (n = 3; n <= N; n += 2)
        s += 4 * n * n - 6 * n + 6;
    printf("%d\n", s);
    return 0;
}
