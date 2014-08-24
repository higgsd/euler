# 6857
import math
import euler
m = 0
N = 600851475143
sieve = euler.prime_sieve(int(math.sqrt(N)))
for p in xrange(len(sieve)):
    if sieve[p] and N % p == 0:
        m = p
print m
