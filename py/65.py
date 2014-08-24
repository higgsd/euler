# 272
N = 100

a = [[1, (n + 1) * 2, 1] for n in range(N/3 + 1)]
a = reduce(lambda x,y: x + y, a)[N-2::-1]
n = 1
d = a[0]
for c in a[1:]:
    n, d = d, c * d + n
print sum([int(c) for c in str(n + 2 * d)])
