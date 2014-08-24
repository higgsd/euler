# 28684
P = 4
MB = 10 ** P
MA = MB / 10

def poly3(n):
    return n * (n + 1) / 2
def poly4(n):
    return n * n
def poly5(n):
    return n * (3 * n - 1) / 2
def poly6(n):
    return n * (2 * n - 1)
def poly7(n):
    return n * (5 * n - 3) / 2
def poly8(n):
    return n * (3 * n - 2)

polyf = [poly3, poly4, poly5, poly6, poly7, poly8]
polyn = [list() for n in range(len(polyf))]
n = 1
while True:
    p = [f(n) for f in polyf]
    if p[0] >= MB:
        break
    for i in range(len(p)):
        if MA <= p[i] < MB and p[i] % 100 >= 10:
            polyn[i].append(p[i])
    n += 1

n = 2
pchain = [((v,), (0,)) for v in polyn[0]]
while n <= 6:
    cchain = []
    for c in pchain:
        for i in range(1,len(polyf)):
            if i in c[1]:
                continue
            for v in polyn[i]:
                if v not in c[0] and c[0][-1] % 100 == v / 100:
                    cchain.append((c[0] + (v,), c[1] + (i,)))
    pchain = cchain
    n += 1

for c in pchain:
    if c[0][0] / 100 == c[0][-1] % 100:
        print sum(c[0])
