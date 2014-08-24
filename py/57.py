# 153
import math
N = 1000
m = 0
n = (1, 3)
d = (1, 2)
for i in range(1,N):
    n = (n[1], n[0] + n[1] * 2)
    d = (d[1], d[0] + d[1] * 2)
    if int(math.log(n[1], 10)) > int(math.log(d[1], 10)):
        m += 1
print m
