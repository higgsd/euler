# 210
def fdigit(n):
    n -= 1
    p = 9
    d = 1
    while n >= d * p:
        n -= d * p
        p *= 10
        d += 1
    v = (10 ** (d - 1)) + n / d
    return int(str(v)[n % d])

p = 1
for i in xrange(7):
    p *= fdigit(10 ** i)
print p
