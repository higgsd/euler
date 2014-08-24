/* 748317 */
#include <stdio.h>
#include "euler.h"

int mknum(int d, char *n)
{
    int i, m, s;
    for (i = 0, m = 1, s = 0; i < d; i++, m *= 10)
        s += n[i] * m;
    return s;
}

int istrunc(int d, char *n)
{
    int i;
    if (!is_prime(mknum(d, n)))
        return 0;
    for (i = 1; i < d; i++)
        if (!is_prime(mknum(d-i, n)) || !is_prime(mknum(d-i, n+i)))
            return 0;
    return 1;
}

int main(int argc, char **argv)
{
    int n = 0, m = 0, s = 0;
    int i, j, aa, a, b, c;
    char first[] = {2, 3, 5, 7};
    char last[] = {3, 7};
    char middle[] = {1, 3, 7, 9};
    char num[10] = {0};

    while (n < 11)
    {
        for (aa = 1, i = 0; i < m; i++)
            aa *= sizeof(middle);

        for (a = 0; a < aa; a++)
        {
            for (i = 0, j = a; i < m; i++, j /= sizeof(middle))
                num[i+1] = middle[j % sizeof(middle)];

            for (b = 0; b < sizeof(first); b++)
            {
                num[m+1] = first[b];
                for (c = 0; c < sizeof(last); c++)
                {
                    num[0] = last[c];
                    if (istrunc(m+2, num))
                    {
                        n++;
                        s += mknum(m+2, num);
                    }
                }
            }
        }
        m++;
    }
    printf("%d\n", s);
    return 0;
}
