# 134043
import euler
N = 4
M = 200000
tgt = [N for i in xrange(N)]
factors = euler.nfactor_sieve(M)
for n in xrange(M-N):
    if factors[n:n+N] == tgt:
        print n
        break
