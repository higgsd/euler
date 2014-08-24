# 296962999629
import euler
D = 4
N = 10 ** D
S = 3330
sieve = euler.prime_sieve(N)
for a in xrange(N/10+1, N, 2):
    b = a + S
    c = b + S
    if a != 1487 and sieve[a] and sieve[b] and sieve[c]:
        aa = euler.digit_usage(a)
        if aa == euler.digit_usage(b) and aa == euler.digit_usage(c):
            print '%d%d%d' % (a, b, c)
            break
