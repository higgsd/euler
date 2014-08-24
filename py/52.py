# 142857
import euler

N = 6
d = 1
while True:
    for n in range(10 ** d, 2 * 10 ** d):
        found = True
        nn = euler.digit_usage(n)
        for i in range(2,N+1):
            if nn != euler.digit_usage(n*i):
                found = False
                break
        if found:
            print n
            break
    if found:
        break
    d += 1
