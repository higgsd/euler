# 1533776805
import euler
n = 144
while True:
    h = n * (2 * n - 1)
    if euler.is_pentagonal(h) and euler.is_triangular(h):
        print h
        break
    n += 1
