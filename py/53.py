# 4075
import euler

N = 1000000
M = 100

s = 0
f = [1]
f += [euler.product(xrange(1,n+1)) for n in xrange(1, M+1)]
for n in xrange(1,M+1):
    for r in xrange(n+1):
        if f[n] / f[r] / f[n-r] > N:
            s += 1
print s
