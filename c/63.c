/* 49 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

int main(int argc, char **argv)
{
    char *s;
    mpz_t x;
    int a, b, f, m;

    m = 0;
    f = 1;
    b = 1;
    mpz_init(x);
    while (f > 0)
    {
        a = f;
        f = -1;
        while (1)
        {
            mpz_ui_pow_ui(x, a, b);
            s = mpz_get_str(NULL, 10, x);
            if (strlen(s) > b)
                break;
            if (strlen(s) == b)
            {
                if (f < 0)
                    f = a;
                m++;
            }
            free(s);
            a++;
        }
        b++;
    }
    printf("%d\n", m);
    return 0;
}
