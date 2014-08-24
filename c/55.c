/* 249 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

#define N 10000
#define M 50

char* strrev(char *str)
{
    int i, s = strlen(str);
    char *n = malloc(s + 1);
    for (i = 0; i < s; i++)
        n[s - i - 1] = str[i];
    n[s] = '\0';
    return n;
}

int main(int argc, char **argv)
{
    mpz_t nn, x;
    char *s1, *s2;
    int n, i, m = N;

    mpz_init(x);
    mpz_init(nn);
    for (n = 0; n < N; n++)
    {
        mpz_set_ui(nn, n);
        s1 = mpz_get_str(NULL, 10, nn);
        s2 = strrev(s1);
        for (i = 0; i < M; i++)
        {
            mpz_set_str(x, s2, 10);
            mpz_add(nn, nn, x);
            free(s1);
            free(s2);
            s1 = mpz_get_str(NULL, 10, nn);
            s2 = strrev(s1);
            if (strcmp(s1, s2) == 0)
            {
                free(s1);
                free(s2);
                m--;
                break;
            }
        }
    }
    printf("%d\n", m);
    return 0;
}
