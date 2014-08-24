/* 840 */
#include <math.h>
#include <stdio.h>

#define N 1000

int main(int argc, char **argv)
{
    double c;
    int a, b, pp;
    int p[N+1] = {0};
    int m = 0, mp = 0;
    for (a = 1; a < N/2; a++)
    {
        for (b = a; b < N/2; b++)
        {
            c = sqrt(a * a + b * b);
            pp = a + b + c;
            if ((int)c == c && pp <= N)
            {
                if (++p[pp] > m)
                {
                    m = p[pp];
                    mp = pp;
                }
            }
        }
    }
    printf("%d\n", mp);
    return 0;
}
