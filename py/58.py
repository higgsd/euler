# 26241
import euler
N = 10

i = 3
p = 3
n = 5
while p * 100 / n >= 10:
    i += 2
    v = i ** 2
    if euler.is_prime(v - (i - 1)):
        p += 1
    if euler.is_prime(v - (i - 1) * 2):
        p += 1
    if euler.is_prime(v - (i - 1) * 3):
        p += 1
    n += 4
print i
