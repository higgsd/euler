# 104743
import euler
N = 10001
M = 200000
sieve = euler.prime_sieve(M)
primes = [p for p in xrange(M) if sieve[p]]
print primes[N-1]
