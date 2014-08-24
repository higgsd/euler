/* 137846528820 */
#include <stdio.h>
#include <gmp.h>

int main(int argc, char **argv)
{
    mpz_t f, f20;
    mpz_init(f);
    mpz_init(f20);

    mpz_fac_ui(f20, 20);
    mpz_fac_ui(f, 40);
    mpz_divexact(f, f, f20);
    mpz_divexact(f, f, f20);

    mpz_out_str(stdout, 10, f);
    printf("\n");
    return 0;
}
