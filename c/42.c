/* 162 */
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "euler.h"

#define N 1000

int main(int argc, char **argv)
{
    char t[N] = {0};
    int s, i = 0, nt = 0;
    while (1)
    {
        s = i * (i + 1) / 2;
        if (s > N)
            break;
        t[s] = 1;
        i++;
    }

    char *tok, *tmp;
    char *input = load_file("../files/words.txt");
    tok = strtok_r(input, ",", &tmp);
    while (tok != NULL)
    {
        tok[strlen(tok) - 1] = '\0';
        tok[0] = '\0';
        s = 0;
        for (i = 0; i < strlen(tok + 1); i++)
            s += tok[i+1] - 'A' + 1;
        if (t[s])
            nt++;
        tok = strtok_r(NULL, ",", &tmp);
    }
    printf("%d\n", nt);
    free(input);
    return 0;
}
