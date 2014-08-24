/* 7273 */
#include <sys/param.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "euler.h"

#define N 100

int main(int argc, char **argv)
{
    int i, j;
    int tri[N][N];
    char *tok1, *tok2, *t1, *t2;
    char *f = load_file("../triangle.txt");

    tok1 = strtok_r(f, "\n", &t1);
    for (i = 0; i < N; i++)
    {
        tok2 = strtok_r(tok1, " ", &t2);
        for (j = 0; j <= i; j++)
        {
            tri[i][j] = atoi(tok2);
            tok2 = strtok_r(NULL, " ", &t2);
        }
        tok1 = strtok_r(NULL, "\n", &t1);
    }
    free(f);

    for (i = 1; i < N; i++)
        for (j = 0; j < N - i; j++)
            tri[N - i - 1][j] +=
                MAX(tri[N - i][j], tri[N-i][j + 1]);
    printf("%d\n", tri[0][0]);
    return 0;
}
