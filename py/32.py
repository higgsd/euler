# 45228
import euler
p = {}
for a in xrange(1, 10000):
    for b in xrange(a+1, 10000 / a + 1):
        c = a * b
        aa = euler.digit_usage(a)
        bb = euler.digit_usage(b)
        cc = euler.digit_usage(c)
        if aa & bb & cc == 0 and aa | bb | cc == int('1111111110', 2):
            p[c] = True
print sum(p.keys())
