/* 1322 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "tree.h"

#define N 10000

struct abd
{
    RB_ENTRY(abd) next;
    struct
    {
        int a;
        int b;
        int d;
    } abd;
};
RB_HEAD(abd_list, abd);

int abd_cmp(struct abd *a, struct abd *b)
{
    return memcmp(&a->abd, &b->abd, sizeof(a->abd));
}

RB_GENERATE(abd_list, abd, next, abd_cmp);

struct abd* snext(int n, int a0, int bp, int dp)
{
    struct abd *t = malloc(sizeof(*t));
    t->abd.d = (n - bp * bp) / dp;
    t->abd.b = a0 - (a0 + bp) % t->abd.d;
    t->abd.a = (a0 + t->abd.b) / t->abd.d;
    return t;
}

int main(int argc, char **argv)
{
    double x;
    int n, a0, m = 0;
    struct abd *t;
    struct abd_list z = RB_INITIALIZER(&z);

    for (n = 0; n <= N; n++)
    {
        x = sqrt(n);
        a0 = floor(x);
        if (a0 == x)
            continue;
        t = snext(n, a0, a0, 1);
        RB_INSERT(abd_list, &z, t);

        while (1)
        {
            t = snext(n, a0, t->abd.b, t->abd.d);
            if (RB_FIND(abd_list, &z, t) == NULL)
            {
                RB_INSERT(abd_list, &z, t);
            }
            else
            {
                free(t);
                a0 = 0;
                while (!RB_EMPTY(&z))
                {
                    t = RB_MIN(abd_list, &z);
                    RB_REMOVE(abd_list, &z, t);
                    free(t);
                    a0++;
                }
                if (a0 % 2 == 1)
                    m++;
                break;
            }
        }
    }
    printf("%d\n", m);
    return 0;
}
