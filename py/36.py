# 872187
N = 1000000
def bstr(n):
    s = []
    while n > 0:
        s.append(str(n & 1))
        n /= 2
    return ''.join(s)

s = 0
for n in xrange(1, N, 2):
    x = str(n)
    if x != x[::-1]:
        continue
    b = bstr(n)
    if b == b[::-1]:
        s += n
print s
