# 376
c2v = dict([(str(i), i) for i in range(2, 10)])
c2v['T'] = 10
c2v['J'] = 11
c2v['Q'] = 12
c2v['K'] = 13
c2v['A'] = 14

def flush(cards):
    if all(map(lambda c: c[1] == cards[0][1], cards)):
        return cards[-1][0]
    return False

def straight(cards):
    m = [(cards[i][0], i + cards[0][0]) for i in range(5)]
    if all(map(lambda c: c[0] == c[1], m)):
        return cards[-1][0]
    return False

def kind(cards):
    n = {}
    for c in cards:
        n[c[0]] = n.setdefault(c[0], 0) + 1
    f = [(v,k) for k,v in n.items()]
    f.sort()
    return f[::-1]

m = 0
for hand in [line.split() for line in file('../files/poker.txt')]:
    cards = [(c2v[c[0]], c[1]) for c in hand]
    p1, p2 = cards[:5], cards[5:]
    p1.sort()
    p2.sort()
    f1 = flush(p1)
    s1 = straight(p1)
    k1 = kind(p1)
    f2 = flush(p2)
    s2 = straight(p2)
    k2 = kind(p2)

    if f2 and s2:
        if f1 and s1 and f1 > f2:
            m += 1
    elif f1 and s1:
        m += 1
    elif k2[0][0] == 4:
        if k1 > k2:
            m += 1
    elif k1[0][0] == 4:
        m += 1
    elif k2[0][0] == 3 and k2[1][0] == 2:
        if k1[0][0] == 3 and k1[1][0] == 2 and k1 > k2:
            m += 1
    elif k1[0][0] == 3 and k1[1][0] == 2:
        m += 1
    elif f2:
        if f1 and f1 > f2:
            m += 1
    elif f1:
        m += 1
    elif s2:
        if s1 and s1 > s2:
            m += 1
    elif s1:
        m += 1
    elif k2[0][0] == 3:
        if k1 > k2:
            m += 1
    elif k1[0][0] == 3:
        m += 1
    elif k2[0][0] == 2 and k2[1][0] == 2:
        if k1[0][0] == 2 and k1[1][0] == 2 and k1 > k2:
            m += 1
    elif k1[0][0] == 2 and k1[1][0] == 2:
        m += 1
    elif k1 > k2:
        m += 1
print m
