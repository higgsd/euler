/* 4075 */
#include <stdio.h>
#include <gmp.h>

#define N 1000000
#define M 100

int main(int argc, char **argv)
{
    int n, r, s = 0;
    mpz_t x, f[M+1];

    mpz_init(x);
    for (n = 0; n <= M; n++)
    {
        mpz_init(f[n]);
        mpz_fac_ui(f[n], n);
    }

    for (n = 1; n <= M; n++)
    {
        for (r = 1; r <= n; r++)
        {
            mpz_set(x, f[n]);
            mpz_divexact(x, x, f[r]);
            mpz_divexact(x, x, f[n-r]);
            if (mpz_cmp_ui(x, N) > 0)
                s++;
        }
    }
    printf("%d\n", s);
    return 0;
}
