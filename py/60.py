# 26033
import euler
N = 5
M = 10000

sieve = euler.prime_sieve(M)
primes = [i for i in range(3,M) if sieve[i]]

pset = {}
for i in range(len(primes)):
    a = primes[i]
    for j in range(i+1, len(primes)):
        b = primes[j]
        ab = int(str(a) + str(b))
        ba = int(str(b) + str(a))
        if euler.is_prime(ab, primes) and euler.is_prime(ba, primes):
            pset.setdefault((a,), []).append(b)

while True:
    cset = {}
    for k in pset.keys():
        for i in range(len(pset[k])):
            for j in range(i+1, len(pset[k])):
                t = k + (pset[k][i],)
                n = pset[k][j]
                f = lambda x: pset.has_key(x) and n in pset[x]
                if all(map(f, [t[:x] + t[x+1:] for x in range(len(t))])):
                    cset.setdefault(t, []).append(n)
    pset = cset
    if len(t) + 1 == N:
        break

print min([sum(k) + pset[k][0] for k in pset.keys()])
