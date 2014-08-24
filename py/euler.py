import math

product = lambda v: reduce(lambda x,y: x*y, v)

def prime_sieve(maxval):
    sieve = [True for n in xrange(maxval)]
    sieve[0] = sieve[1] = False
    for n in xrange(2, maxval):
        if sieve[n]:
            for x in xrange(n * 2, maxval, n):
                sieve[x] = False
    return sieve
def nfactor_sieve(maxval):
    sieve = [0 for n in xrange(maxval)]
    for n in xrange(2, maxval):
        if sieve[n] == 0:
            for x in xrange(n * 2, maxval, n):
                sieve[x] += 1
    return sieve

def is_prime(n, primes=None):
    if primes is not None:
        for p in primes:
            if n % p == 0:
                return False
        return True

    if n < 2:
        return False
    if n % 2 == 0 and n != 2:
        return False
    for d in xrange(3, int(math.sqrt(n)) + 1, 2):
        if n % d == 0:
            return False
    return True

def all_factors(n):
    f_lo = []
    f_hi = []
    s = math.sqrt(n)
    for d in xrange(1, int(s) + 1):
        if n % d == 0:
            if d * d == n:
                f_lo.append(d)
            else:
                f_lo.append(d)
                f_hi.insert(0, n/d)
    return f_lo + f_hi
count_factors = lambda n: len(all_factors(n))

load_word_file = lambda fname: [name[1:-1].lower() for name in file(fname).readlines()[0].split(',')]
word_score = lambda word: sum([ord(c) - ord('a') + 1 for c in word])

def digit_usage(n, d=None):
    v = 0
    if d is None:
        d = len(str(n))
    for i in xrange(d):
        v |= 1 << (n % 10)
        n /= 10
    return v

def reduce_fraction(n, d):
    dd = 2
    while dd < math.sqrt(d):
        while n % dd == 0 and d % dd == 0:
            n /= dd
            d /= dd
        dd += 1
    return (n, d)

def solve_quadratic(a, b, c):
    delta = math.sqrt(b * b - 4 * a * c)
    r = (delta - b) / (2 * a)
    if r < 0:
        r = (-delta - b) / (2 * a)
    return r
def is_triangular(t):
    r = solve_quadratic(0.5, 0.5, -t)
    return (r == math.floor(r))
def is_pentagonal(p):
    r = solve_quadratic(1.5, -0.5, -p)
    return (r == math.floor(r))
