# 906609
m = 0
for i in xrange(100,1000):
    for j in xrange(i,1000):
        k = i * j
        if k > m:
            s = str(k)
            if s == s[::-1]:
                m = k
print m
