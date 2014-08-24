#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "euler.h"

int prime_sieve(int maxval, char **s, int **pp)
{
    int p, i, np = 0;
    int *primes = NULL;
    char *sieve = malloc(maxval);
    memset(sieve, 1, maxval);
    if (pp != NULL)
        primes = calloc(maxval, sizeof(int));

    sieve[0] = sieve[1] = 0;
    for (p = 0; p < maxval; p++)
    {
        if (sieve[p])
        {
            if (pp != NULL)
                primes[np++] = p;
            for (i = p * 2; i < maxval; i += p)
                sieve[i] = 0;
        }
    }

    *s = sieve;
    if (pp != NULL)
        *pp = realloc(primes, np * sizeof(int));
    return np;
}

char* nfactor_sieve(int maxval)
{
    int p, i;
    char *sieve = calloc(maxval, 1);
    for (p = 2; p < maxval; p++)
        if (sieve[p] == 0)
            for (i = p * 2; i < maxval; i += p)
                sieve[i]++;
    return sieve;
}

int is_prime(int n)
{
    int i, s = sqrt(n) + 1;
    if (n % 2 == 0 && n != 2)
        return 0;
    for (i = 3; i < s; i += 2)
        if (n % i == 0)
            return 0;
    return 1;
}

int count_factors(int n)
{
    int d, nf = 0;
    int s = sqrt(n);
    for (d = 1; d <= s; d++)
    {
        if (n % d == 0)
        {
            if (d * d == n)
                nf++;
            else
                nf += 2;
        }
    }
    return nf;
}

int all_factors(int n, int **ff)
{
    int i, d, nf;
    int s = sqrt(n);
    int *f = malloc(2 * s * sizeof(int));

    i = nf = 0;
    for (d = 1; d <= s; d++)
    {
        if (n % d == 0)
        {
            if (d * d == n)
            {
                nf++;
                f[i++] = d;
            }
            else
            {
                nf += 2;
                f[i++] = d;
                f[2 * s - i] = n / d;
            }
        }
    }

    memcpy(f + i, f + 2 * s - (nf / 2), (nf / 2) * sizeof(int));
    *ff = realloc(f, nf * sizeof(int));
    return nf;
}

int digit_usage(long long n, int d)
{
    int i = 0, v = 0;
    while (1)
    {
        if ((n == 0 && d == 0) || (d != 0 && i == d))
            break;
        v |= 1 << (n % 10);
        n /= 10;
        i++;
    }
    return v;
}

char* load_file(char *fname)
{
    int fd;
    char *data;
    struct stat st;

    fd = open(fname, O_RDONLY);
    fstat(fd, &st);
    data = malloc(st.st_size + 1);
    read(fd, data, st.st_size);
    data[st.st_size] = '\0';
    close(fd);
    return data;
}

double solve_quadratic(double a, double b, double c)
{
    double delta = sqrt(b * b - 4 * a * c);
    double r = (delta - b) / (2 * a);
    if (r < 0)
        r = (-delta - b) / (2 * a);
    return r;
}

int is_triangular(int t)
{
    double n = solve_quadratic(0.5, 0.5, -t);
    return (n == floor(n));
}

int is_pentagonal(int p)
{
    double n = solve_quadratic(1.5, -0.5, -p);
    return (n == floor(n));
}
