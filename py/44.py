# 5482660
import euler
i = 1
p = [0]
m = None
while m is None:
    p.append(i * (3 * i - 1) / 2)
    if p[i] % 2 == 0:
        j = 1
        while i > j:
            if p[j] % 2 == 0 and euler.is_pentagonal(p[i] - p[j]) and \
                    euler.is_pentagonal(p[i] + p[j]):
                m = p[i] - p[j]
                break
            j += 1
    i += 1
print m
