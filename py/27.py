# -59231
import euler
N = 1000
M = 80
m = -1
ab = 0
sieve = euler.prime_sieve(M * M + M * N + N)
for a in xrange(1-N, N):
    for b in xrange(2, N):
        n = 0
        while True:
            c = n * n + a * n + b
            if c < 2 or not sieve[c]:
                if n > m:
                    m = n
                    ab = a * b
                break
            n += 1
print ab
