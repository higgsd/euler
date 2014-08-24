/* 932718654 */
#include <string.h>
#include <stdio.h>
#include "euler.h"

#define N 10000

int mknum(char *s)
{
    int len = strlen(s);
    int i, d, n = 0;
    for (i = 0, d = 1; i < len; i++, d *= 10)
        n += (s[len - i - 1] - '0') * d;
    return n;
}

int main(int argc, char **argv)
{
    char s[6], str[20];
    int a, n, v, m = 0;

    for (a = 1; a < N; a++)
    {
        n = 0;
        str[0] = '\0';
        while (strlen(str) < 9)
        {
            n++;
            sprintf(s, "%d", a * n);
            strcat(str, s);
            if (strlen(str) == 9)
            {
                v = mknum(str);
                if (digit_usage(mknum(str), 0) == 0x3fe && v > m)
                    m = v;
            }
        }
    }
    printf("%d\n", m);
    return 0;
}
