/* 4782 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <gmp.h>

#define N 1000

int main(int argc, char **argv)
{
    int n = 12;
    char *s = NULL;
    mpz_t f1, f2, f3;
    mpz_init(f1);
    mpz_init(f2);
    mpz_init(f3);

    mpz_fib2_ui(f2, f1, n++);
    while (1)
    {
        mpz_add(f3, f1, f2);
        if (mpz_sizeinbase(f3, 10) >= N)
        {
            s = mpz_get_str(NULL, 10, f3);
            if (strlen(s) == N)
            {
                printf("%d\n", n);
                break;
            }
            free(s);
        }
        mpz_add(f1, f2, f3);
        if (mpz_sizeinbase(f1, 10) >= N)
        {
            s = mpz_get_str(NULL, 10, f2);
            if (strlen(s) == N)
            {
                printf("%d\n", n + 1);
                break;
            }
            free(s);
        }
        mpz_add(f2, f3, f1);
        if (mpz_sizeinbase(f2, 10) >= N)
        {
            s = mpz_get_str(NULL, 10, f2);
            if (strlen(s) == N)
            {
                printf("%d\n", n + 2);
                break;
            }
            free(s);
        }
        n += 3;
    }
    free(s);
    return 0;
}
