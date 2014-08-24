# 249
N = 10000
M = 50
m = N
for n in range(N):
    s1 = str(n)
    s2 = s1[::-1]
    for i in range(M):
        n += int(s2)
        s1 = str(n)
        s2 = s1[::-1]
        if s1 == s2:
            m -= 1
            break
print m
