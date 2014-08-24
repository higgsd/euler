# 31626
import euler
N = 10000
s = 0
for a in xrange(2,N):
    b = sum(euler.all_factors(a)[:-1])
    db = sum(euler.all_factors(b)[:-1])
    if a != b and a == db:
        s += a
print s
