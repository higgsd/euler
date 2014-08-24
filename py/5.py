# 232792560
import euler
D = [n for n in xrange(2,21)]
n = euler.product(D)
m = 0
for d in D:
    nx = n / d
    while all([nx % dx == 0 for dx in D]):
        n = nx
        nx = n / d
        m = n
print m
