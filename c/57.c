/* 153 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#define N 1000

int main(int argc, char **argv)
{
    int i, m = 0;
    char *ns, *ds;
    mpz_t na, nb, nc;
    mpz_t da, db, dc;

    mpz_init_set_ui(na, 1);
    mpz_init_set_ui(da, 1);
    mpz_init_set_ui(nb, 3);
    mpz_init_set_ui(db, 2);
    mpz_init(nc);
    mpz_init(dc);

    for (i = 1; i < N; i++)
    {
        mpz_mul_ui(nc, nb, 2);
        mpz_mul_ui(dc, db, 2);
        mpz_add(nc, na, nc);
        mpz_add(dc, da, dc);
        ns = mpz_get_str(NULL, 10, nc);
        ds = mpz_get_str(NULL, 10, dc);
        if (strlen(ns) > strlen(ds))
            m++;
        free(ns);
        free(ds);
        mpz_set(na, nb);
        mpz_set(da, db);
        mpz_set(nb, nc);
        mpz_set(db, dc);
    }
    printf("%d\n", m);
    return 0;
}
