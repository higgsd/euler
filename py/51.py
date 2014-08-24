# 121313
import euler

N = 8
D = 6
M = 10 ** D

def digit_mask(p, m):
    d, pp, kd = 1, p, None
    while p > 0:
        if m & 1:
            pd = p % 10
            if kd is not None and pd != kd:
                return (False, 0)
            pp -= pd * d
            kd = pd
        d *= 10
        p /= 10
        m /= 2
    return (True, pp)

sieve = euler.prime_sieve(M)
dprimes = [[p for p in xrange(10**d, 10**(d+1)) if sieve[p]] for d in range(D)]

d = 5
mv = None
while mv is None:
    primes = dprimes[d-1]
    for m in xrange(1, 2 ** d - 1):
        mprimes = {}
        for p in primes:
            mk, mp = digit_mask(p, m)
            if mk:
                if not mprimes.has_key(mp):
                    mprimes[mp] = [p, 1]
                else:
                    mprimes[mp][1] += 1
        for (p,n) in mprimes.values():
            if n == N and (mv is None or mv > p):
                mv = p
    d += 1
print mv
