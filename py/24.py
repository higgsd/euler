# 2783915460
import euler
N = 10
T = 1000000
f = euler.product(xrange(1, N)) 
v = T - 1
a = []
d = [n for n in xrange(N)]
for n in xrange(N):
    x = v / f
    v %= f
    a.append(d[x])
    del d[x]
    if n + 1 != N:
        f /= N - n - 1
print ''.join([str(x) for x in a])

