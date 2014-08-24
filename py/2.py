# 4613732
N = 4000000
s = 2
p = (1, 2)
while True:
    n = sum(p)
    if n > N:
        break
    if n % 2 == 0:
        s += n
    p = (p[1], n)
print s
