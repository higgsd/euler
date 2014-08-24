# 127035954683
N = 5

n = 1
d = len(str(n**3))
while True:
    c = {}
    while True:
        v = tuple(sorted(str(n ** 3)))
        if len(v) > d:
            d = len(v)
            break
        c.setdefault(v, []).append(n ** 3)
        n += 1

    m = None
    for v in c.values():
        if len(v) == N:
            if m is None or m > v[0]:
                m = v[0]
    if m is not None:
        break
print m
