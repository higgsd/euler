/* 28684 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "queue.h"

#define N 6
#define MA 1000
#define MB 10000

struct polyn
{
    int (*f)(int);
    int sz;
    int n[100];
};

struct chain
{
    SLIST_ENTRY(chain) next;
    int n[N];
    int i[N];
};
SLIST_HEAD(chain_list, chain);

int poly3(int n) { return n * (n + 1) / 2; }
int poly4(int n) { return n * n; }
int poly5(int n) { return n * (3 * n - 1) / 2; }
int poly6(int n) { return n * (2 * n - 1); }
int poly7(int n) { return n * (5 * n - 3) / 2; }
int poly8(int n) { return n * (3 * n - 2); }

int main(int argc, char **argv)
{
    int i, p[N], n = 1;
    struct polyn pn[N];
    pn[0].f = poly3; pn[0].sz = 0;
    pn[1].f = poly4; pn[1].sz = 0;
    pn[2].f = poly5; pn[2].sz = 0;
    pn[3].f = poly6; pn[3].sz = 0;
    pn[4].f = poly7; pn[4].sz = 0;
    pn[5].f = poly8; pn[5].sz = 0;

    while (1)
    {
        for (i = 0; i < N; i++)
            p[i] = pn[i].f(n);
        if (p[0] >= MB)
            break;
        for (i = 0; i < N; i++)
            if (MA <= p[i] && p[i] < MB && p[i] % 100 >= 10)
                pn[i].n[pn[i].sz++] = p[i];
        n++;
    }

    struct chain *c;
    struct chain_list pchain = SLIST_HEAD_INITIALIZER(&pchain);
    for (i = 0; i < pn[0].sz; i++)
    {
        c = calloc(1, sizeof(*c));
        c->i[0] = 0;
        c->n[0] = pn[0].n[i];
        SLIST_INSERT_HEAD(&pchain, c, next);
    }

    struct chain *t;
    int skip, j, k, v;
    struct chain_list cchain = SLIST_HEAD_INITIALIZER(&pchain);
    n = 1;
    while (n < 6)
    {
        SLIST_FOREACH(c, &pchain, next)
        {
            for (i = 1; i < N; i++)
            {
                skip = 0;
                for (j = 0; j < n; j++)
                {
                    if (i == c->i[j])
                    {
                        skip = 1;
                        break;
                    }
                }
                if (skip)
                    continue;
                for (j = 0; j < pn[i].sz; j++)
                {
                    v = pn[i].n[j];
                    if (c->n[n-1] % 100 != v / 100)
                        continue;
                    skip = 0;
                    for (k = 0; k < n; k++)
                    {
                        if (v == c->n[k])
                        {
                            skip = 1;
                            break;
                        }
                    }
                    if (!skip)
                    {
                        t = calloc(1, sizeof(*t));
                        bcopy(c, t, sizeof(*t));
                        t->n[n] = v;
                        t->i[n] = i;
                        SLIST_INSERT_HEAD(&cchain, t, next);
                    }
                }
            }
        }

        while (!SLIST_EMPTY(&pchain))
        {
            c = SLIST_FIRST(&pchain);
            SLIST_REMOVE_HEAD(&pchain, next);
            free(c);
        }
        i = 0;
        while (!SLIST_EMPTY(&cchain))
        {
            c = SLIST_FIRST(&cchain);
            SLIST_REMOVE_HEAD(&cchain, next);
            SLIST_INSERT_HEAD(&pchain, c, next);
            i++;
        }
        n++;
    }

    while (!SLIST_EMPTY(&pchain))
    {
        n = 0;
        c = SLIST_FIRST(&pchain);
        SLIST_REMOVE_HEAD(&pchain, next);
        if (c->n[0] / 100 == c->n[N-1] % 100)
        {
            for (i = 0; i < N; i++)
                n += c->n[i];
            printf("%d\n", n);
        }
        free(c);
    }
    return 0;
}
