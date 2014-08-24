# 661
import math
N = 1000

m = 0
md = 0
for d in range(N+1):
    x = math.sqrt(d)
    a0 = int(x)
    if x == a0:
        continue
    P = a0
    Q = d - a0 * a0
    a = (a0 + P) / Q
    pp = a0
    pn = a0 * a + 1
    qp = 1
    qn = a
    while pn * pn  - d * qn * qn != 1:
        P = a * Q - P
        Q = (d - P * P) / Q
        a = (a0 + P) / Q
        pp, pn = pn, a * pn + pp
        qp, qn = qn, a * qn + qp
    if pn > m:
        m = pn
        md = d
print md
