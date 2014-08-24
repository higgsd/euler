# 100
import math
import euler
D = 2
N = 10 ** D
np = 1
dp = 1
for n in xrange(N/10, N):
    for d in xrange(n+1, N):
        nn = euler.digit_usage(n)
        dd = euler.digit_usage(d)
        c = nn & dd
        if c == 0 or c == 1 or math.log(c, 2) % 1.0 != 0 or \
                nn ^ c == 0 or dd ^ c == 0:
            continue
        n2 = math.log(nn ^ c, 2)
        d2 = math.log(dd ^ c, 2)
        if d2 != 0 and float(n) / d == n2 / d2:
            np *= n
            dp *= d
np, dp = euler.reduce_fraction(np, dp)
print dp
