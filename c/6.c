/* 25164150 */
#include <stdio.h>

#define N 100

int main(int argc, char **argv)
{
    int i, s1 = 0, s2 = 0;
    for (i = 1; i <= N; i++)
    {
        s1 += i * i;
        s2 += i;
    }
    s2 *= s2;
    printf("%d\n", s2 - s1);
    return 0;
}
