/* 4613732 */
#include <stdio.h>

#define N 4000000

int main(int argc, char **argv)
{
    int n;
    int s = 2;
    int p[2] = {1, 2};

    while (1)
    {
        n = p[0] + p[1];
        if (n > N)
            break;
        if (n % 2 == 0)
            s += n;
        p[0] = p[1];
        p[1] = n;
    }
    printf("%d\n", s);
    return 0;
}
