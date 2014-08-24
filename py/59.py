# 107359
import sys, string
N = 3
s = ''.join([line.strip() for line in file('../cipher1.txt')])
e = [int(v) for v in s.split(',')]
ks = [list() for n in range(N)]
for k in range(ord('a'), ord('z') + 1):
    for n in range(N):
        if all([(chr(v ^ k) in string.printable) for v in e[n::3]]):
            ks[n].append(k)

kn = [len(ks[n]) for n in range(N)]
for nn in range(reduce(lambda x,y: x*y, kn)):
    k = []
    for n in range(N):
        k.append(ks[n][nn % kn[n]])
        nn /= kn[n]
    c = [e[i] ^ k[i % N] for i in range(len(e))]
    ct = ''.join([chr(v) for v in c])
    if ct.find(' the ') != -1:
        print sum(c)
        break
