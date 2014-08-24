# 932718654
import euler
N = 9
m = 0
for a in xrange(1, 10 ** (N/2)):
    n = 0
    s = ''
    while len(s) < N:
        n += 1
        s += str(a * n)
        if len(s) == N and euler.digit_usage(int(s)) == int('1' * 9 + '0', 2):
            if int(s) > m:
                m = int(s)
print m
