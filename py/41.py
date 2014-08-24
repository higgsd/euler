# 7652413
import euler
N = 7
m = 0
d = '123456789'
for i in xrange(euler.product(xrange(1, N + 1))):
    v = []
    dd = list(d)
    for j in xrange(N):
        v.append(dd.pop(i % (N - j)))
        i /= (N - j)
    vv = int(''.join(v))
    if euler.is_prime(vv) and vv > m:
        m = vv
print m
