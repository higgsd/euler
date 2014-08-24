# 5777
import euler
N = 10000
found = False
sieve = euler.prime_sieve(N)
for n in xrange(9, N, 2):
    if not sieve[n]:
        s = 1
        while True:
            s2 = 2 * s * s
            if s2 > n:
                found = True
                print n
                break
            if sieve[n - s2]:
                break
            s += 1
    if found:
        break
