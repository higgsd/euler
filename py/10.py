# 142913828922
import euler
N = 2000000
sieve = euler.prime_sieve(N)
print sum([p for p in xrange(N) if sieve[p]])
