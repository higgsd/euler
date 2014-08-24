/* 107359 */
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "euler.h"

#define N 3
#define M ('z' - 'a' + 1)

int main(int argc, char **argv)
{
    char *tok, *tmp;
    char *input = load_file("../files/cipher1.txt");

    int len = 0;
    char *s = strdup(input);
    tok = strtok_r(input, ",", &tmp);
    while (tok != NULL)
    {
        s[len++] = atoi(tok);
        tok = strtok_r(NULL, ",", &tmp);
    }
    s[len] = '\0';
    bcopy(s, input, len + 1);

    char ks[N][M];
    int kn[N] = {0};
    int n, c, i, found;
    for (n = 0; n < N; n++)
    {
        bzero(ks[n], sizeof(ks[n]));
        for (c = 'a'; c <= 'z'; c++)
        {
            found = 1;
            for (i = n; i < len && found; i += N)
                if (!isprint(c ^ s[i]))
                    found = 0;
            if (found)
                ks[n][kn[n]++] = c;
        }
    }

    char k[N];
    int nn, nnn = 1;
    for (i = 0; i < N; i++)
        nnn *= kn[i];
    for (n = 0; n < nnn; n++)
    {
        nn = n;
        for (i = 0; i < N; i++)
        {
            k[i] = ks[i][nn % kn[i]];
            nn /= kn[i];
        }
        for (i = 0; i < len; i++)
            s[i] = input[i] ^ k[i % N];
        if (strstr(s, " the ") != NULL)
        {
            nn = 0;
            for (i = 0; i < len; i++)
                nn += s[i];
            printf("%d\n", nn);
            break;
        }
    }
    free(s);
    free(input);
    return 0;
}
