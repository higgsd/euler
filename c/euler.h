#ifndef EULER_H
#define EULER_H

int prime_sieve(int maxval, char **sieve, int **primes);
char* nfactor_sieve(int maxval);
int is_prime(int n);
int count_factors(int n);
int all_factors(int n, int **factors);
int digit_usage(long long n, int d);
char *load_file(char *fname);
int is_triangular(int t);
int is_pentagonal(int p);

#endif /* EULER_H */
