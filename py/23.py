# 4179871
import euler
N = 28123
ab = []
for n in xrange(12, N+1):
    if sum(euler.all_factors(n)[:-1]) > n:
        ab.append(n)
abab = [n for n in xrange(N+1)]
for a in ab:
    for b in ab:
        if a + b > N:
            break
        abab[a+b] = 0
print sum(abab)
