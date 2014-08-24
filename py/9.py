# 31875000
import sys
N = 1000
for a in xrange(N):
    for b in xrange(a + 1, N - a):
        c = N - a - b
        if c > b and a * a + b * b == c * c:
            print a * b * c
            sys.exit(0)
