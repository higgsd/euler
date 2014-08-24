# 40730
import euler
f = [1]
f += [euler.product(range(1, i + 1)) for i in range(1, 10)]
s = 0
for n in xrange(11, 7 * f[9]):
    if n == sum([f[int(c)] for c in str(n)]):
        s += n
print s
