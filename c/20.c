/* 648 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <gmp.h>

int main(int argc, char **argv)
{
    int i, s = 0;
    char *str = NULL;
    mpz_t f;

    mpz_init(f);
    mpz_fac_ui(f, 100);
    str = mpz_get_str(NULL, 10, f);
    for (i = 0; i < strlen(str); i++)
        s += str[i] - '0';
    free(str);
    printf("%d\n", s);
    return 0;
}
