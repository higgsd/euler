# 972
N = 100
Z = ord('0')
m = 0
for a in xrange(1,N):
    for b in xrange(1,N):
        n = sum([ord(c) - Z for c in str(a ** b)])
        if n > m:
            m = n
print m
