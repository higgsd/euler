# 76576500
import euler
N = 500
i = 1
t = 1
while euler.count_factors(t) <= N:
    i += 1
    t += i
print t
