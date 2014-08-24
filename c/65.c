/* 272 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#define N 99

int main(int argc, char **argv)
{
    char *s;
    mpz_t n, d, t;
    int i, m, a[N];

    for (i = 0; i < N; i++)
    {
        if (i % 3 == 1)
            a[N - i - 1] = ((i / 3) + 1) * 2;
        else
            a[N - i - 1] = 1;
    }

    mpz_init(t);
    mpz_init_set_ui(n, 1);
    mpz_init_set_ui(d, a[0]);
    for (i = 1; i < N; i++)
    {
        mpz_set(t, d);
        mpz_mul_ui(d, d, a[i]);
        mpz_add(d, d, n);
        mpz_set(n, t);
    }
    mpz_mul_ui(d, d, 2);
    mpz_add(d, d, n);

    m = 0;
    s = mpz_get_str(NULL, 10, d);
    for (i = 0; i < strlen(s); i++)
        m += s[i] - '0';
    printf("%d\n", m);
    free(s);
    return 0;
}
