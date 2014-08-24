/* 9183 */
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>
#include "tree.h"

struct apowb
{
    RB_ENTRY(apowb) next;
    mpz_t n;
};
RB_HEAD(ab_list, apowb);

int cmp_ab(struct apowb *a, struct apowb *b)
{
    return mpz_cmp(a->n, b->n);
}

RB_GENERATE(ab_list, apowb, next, cmp_ab);

int main(int argc, char **argv)
{
    int a, b, m = 0;
    struct ab_list s;
    struct apowb ab, *nab;
    RB_INIT(&s);
    mpz_init(ab.n);

    for (a = 2; a <= 100; a++)
    {
        for (b = 2; b <= 100; b++)
        {
            mpz_ui_pow_ui(ab.n, a, b);
            if (RB_FIND(ab_list, &s, &ab) == NULL)
            {
                nab = malloc(sizeof(ab));
                mpz_init_set(nab->n, ab.n);
                RB_INSERT(ab_list, &s, nab);
                m++;
            }
        }
    }
    printf("%d\n", m);

    while (!RB_EMPTY(&s))
    {
        nab = RB_MIN(ab_list, &s);
        RB_REMOVE(ab_list, &s, nab);
        free(nab);
    }
    return 0;
}
