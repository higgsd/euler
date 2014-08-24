/* 972 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#define N 100

int main(int argc, char **argv)
{
    mpz_t c;
    char *s;
    int a, b, i, n, m = 0;

    mpz_init(c);
    for (a = 1; a < N; a++)
    {
        for (b = 1; b < N; b++)
        {
            n = 0;
            mpz_ui_pow_ui(c, a, b);
            s = mpz_get_str(NULL, 10, c);
            for (i = 0; i < strlen(s); i++)
                n += s[i] - '0';
            if (n > m)
                m = n;
            free(s);
        }
    }
    printf("%d\n", m);
    return 0;
}
