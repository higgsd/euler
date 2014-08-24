# 840
import math

N = 1000
p = [0 for i in xrange(N + 1)]
for a in xrange(1, N/2):
    for b in xrange(a, N/2):
        cc = math.sqrt(a * a + b * b)
        c = int(cc)
        if c == cc and a + b + c <= N:
            p[a + b + c] += 1

m = 0
mv = 0
for i in xrange(N + 1):
    if p[i] > m:
        m = p[i]
        mv = i
print mv
