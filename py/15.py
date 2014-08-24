# 137846528820
import euler
N = 20
f20 = euler.product(xrange(1, N+1))
print euler.product(xrange(1, N*2+1)) / (f20 * f20)
