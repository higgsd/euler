# 983
N = 1000
mn = md = 0
for n in xrange(2, N):
    d = 1
    r = 1
    p = {0: True, 1: True}
    while True:
        r = (r * 10) % n
        if r in p.keys():
            break
        p[r] = True
        d += 1
    if d > md:
        md = d
        mn = n
print mn
