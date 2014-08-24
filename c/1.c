/* 233168 */
#include <stdio.h>

#define N 1000

int main(int argc, char **argv)
{
    int i, s = 0;
    for (i = 0; i < N; i++)
    {
        if (i % 3 == 0 || i % 5 == 0)
        {
            s += i;
        }
    }
    printf("%d\n", s);
    return 0;
}
