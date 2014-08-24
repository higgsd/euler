# 4782
N = 1000
n = 2
a = 1
b = 1
while len(str(b)) < N:
    a, b = b, a + b
    n += 1
print n
