/* 9110846700 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#define N 1000
#define P 10

int main(int argc, char **argv)
{
    int n;
    char *str;
    mpz_t s, p;
    mpz_init(p);
    mpz_init_set_ui(s, 0);
    for (n = 1; n <= N; n++)
    {
        mpz_ui_pow_ui(p, n, n);
        mpz_add(s, s, p);
    }
    str = mpz_get_str(NULL, 10, s);
    printf("%s\n", str + strlen(str) - P);
    free(str);
    return 0;
}
