/* 661 */
#include <stdio.h>
#include <math.h>
#include <gmp.h>

#define N 1000

int main(int argc, char **argv)
{
    double x;
    int md = 0, d, a0, t;
    mpz_t m, P, Q, a, pp, pn, qp, qn, tr, tl;

    mpz_init_set_ui(m, 0); mpz_init(P); mpz_init(Q); mpz_init(a);
    mpz_init(pp); mpz_init(pn); mpz_init(qp); mpz_init(qn);
    mpz_init(tr); mpz_init(tl);
    for (d = 0; d <= N; d++)
    {
        x = sqrt(d);
        a0 = x;
        if (a0 == x)
            continue;
        mpz_set_ui(P, a0);
        t = d - a0 * a0; mpz_set_ui(Q, t);
        t = 2 * a0 / t; mpz_set_ui(a, t);
        mpz_set_ui(pp, a0);
        mpz_set_ui(pn, a0 * t + 1);
        mpz_set_ui(qp, 1);
        mpz_set_ui(qn, t);
        while (1)
        {
            mpz_mul(tr, qn, qn); mpz_mul_ui(tr, tr, d);
            mpz_mul(tl, pn, pn); mpz_sub(tl, tl, tr);
            if (mpz_cmp_ui(tl, 1) == 0)
            {
                mpz_set(qp, qn); mpz_set(qn, tr);
                if (mpz_cmp(pn, m) > 0)
                {
                    mpz_set(m, pn);
                    md = d;
                }
                break;
            }
            mpz_mul(tr, a, Q); mpz_sub(P, tr, P);
            mpz_mul(tr, P, P); mpz_ui_sub(tr, d, tr); mpz_divexact(Q, tr, Q);
            mpz_add_ui(a, P, a0); mpz_fdiv_q(a, a, Q);
            mpz_mul(tr, a, pn); mpz_add(tr, tr, pp);
            mpz_set(pp, pn); mpz_set(pn, tr);
            mpz_mul(tr, a, qn); mpz_add(tr, tr, qp);
            mpz_set(qp, qn); mpz_set(qn, tr);
        }
    }
    printf("%d\n", md);
    return 0;
}
