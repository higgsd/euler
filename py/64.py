# 1322
import math
N = 10000

def snext(n, a0, bp, dp):
    d = (n - bp ** 2) / dp
    b = a0 - (a0 + bp) % d
    a = (a0 + b) / d
    return (a, b, d)

m = 0
for n in range(N+1):
    x = math.sqrt(n)
    a0 = int(x)
    if a0 == x:
        continue
    abd = snext(n, a0, a0, 1)
    z = {abd: True}
    while True:
        abd = snext(n, a0, abd[1], abd[2])
        if abd in z.keys():
            break
        z[abd] = True
    if len(z) % 2 == 1:
        m += 1
print m
