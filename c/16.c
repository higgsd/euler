/* 1366 */
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <gmp.h>

int main(int argc, char **argv)
{
    char *str;
    int i, s = 0;
    mpz_t p;

    mpz_init(p);
    mpz_ui_pow_ui(p, 2, 1000);
    str = mpz_get_str(NULL, 10, p);

    for (i = 0; i < strlen(str); i++)
        s += str[i] - '0';
    free(str);
    printf("%d\n", s);
    return 0;
}
