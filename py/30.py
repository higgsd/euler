# 443839
N = 5
s = 0
for n in xrange(2, 9 ** N * (N + 1)):
    if n == sum([int(c) ** N for c in str(n)]):
        s += n
print s
