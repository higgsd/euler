# 55
import euler
N = 1000000
sieve = euler.prime_sieve(N)

ss = 0
for n in xrange(N):
    if sieve[n]:
        nn = n
        circular = True
        while True:
            s = str(nn)
            nn = int(s[-1] + s[:-1])
            if nn == n:
                break
            if not sieve[nn]:
                circular = False
                break
        if circular:
            ss += 1
print ss
