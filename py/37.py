# 748317
import euler
N = 11
first = (2, 3, 5, 7)
middle = (1, 3, 7, 9)
last = (3, 7)

def gen_mids(n):
    if n == 0:
        yield []
    else:
        for m in middle:
            for mm in gen_mids(n-1):
                x = [m]
                x.extend(mm)
                yield x

def istrunc(n):
    if not euler.is_prime(n):
        return False
    s = str(n)
    for i in xrange(1, len(s)):
        if not euler.is_prime(int(s[i:])):
            return False
        if not euler.is_prime(int(s[:-i])):
            return False
    return True

n = 0
m = 0
s = 0
while n < N:
    for a in first:
        for b in gen_mids(m):
            for c in last:
                v = int(''.join([str(vv) for vv in [a] + b + [c]]))
                if istrunc(v):
                    n += 1
                    s += v
    m += 1
print s
