# 9183
N = 100
s = {}
for a in xrange(2, N+1):
    for b in xrange(2, N+1):
        s[a ** b] = True
print len(s)
