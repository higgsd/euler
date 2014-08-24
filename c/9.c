/* 31875000 */
#include <stdio.h>

#define N 1000

int main(int argc, char **argv)
{
    int a, b, c;
    for (a = 0; a <= N/3; a++)
    {
        for (b = a + 1; a + b * 2 + 1 < N; b++)
        {
            c = N - a - b;
            if (a * a + b * b == c * c)
            {
                printf("%d\n", a * b * c);
                return 0;
            }
        }
    }
    return 0;
}
