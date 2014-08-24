/* 127035954683 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tree.h"

#define N 5

struct cube
{
    RB_ENTRY(cube) next;
    int sz;
    char s[20];
    long long n[N];
};
RB_HEAD(cube_list, cube);

int cmp_cube(struct cube *a, struct cube *b)
{
    return strcmp(a->s, b->s);
}

RB_GENERATE(cube_list, cube, next, cmp_cube);

int cmp_char(const void *a, const void *b)
{
    const char *aa = a, *bb = b;
    return *aa - *bb;
}

int main(int argc, char **argv)
{
    int d = 1;
    long long m, n = 1;
    struct cube k, *t;
    struct cube_list c = RB_INITIALIZER(&c);

    while (1)
    {
        while (1)
        {
            sprintf(k.s, "%lld", n * n * n);
            qsort(k.s, strlen(k.s), 1, cmp_char);
            if (strlen(k.s) > d)
            {
                d = strlen(k.s);
                break;
            }
            t = RB_FIND(cube_list, &c, &k);
            if (t == NULL)
            {
                t = calloc(1, sizeof(*t));
                strcpy(t->s, k.s);
                t->sz = 0;
                RB_INSERT(cube_list, &c, t);
            }
            t->n[t->sz++] = n * n * n;
            n++;
        }

        m = -1;
        while (!RB_EMPTY(&c))
        {
            t = RB_MIN(cube_list, &c);
            RB_REMOVE(cube_list, &c, t);
            if (t->sz == N && (m == -1 || m > t->n[0]))
                m = t->n[0];
            free(t);
        }
        if (m != -1)
            break;
    }
    printf("%lld\n", m);
    return 0;
}
