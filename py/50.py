# 997651
import euler
N = 1000000
m = 0
sieve = euler.prime_sieve(N)
primes = [p for p in xrange(N) if sieve[p]]
for n in xrange(2, len(primes)+1):
    if n % 2 == 0:
        p = sum(primes[:n])
        if p >= N:
            break
        if sieve[p]:
            m = p
    else:
        for i in xrange(1, len(primes) - n):
            p = sum(primes[i:i+n])
            if p >= N:
                break
            if sieve[p]:
                m = p
                break
print m
