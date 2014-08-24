# 837799
N = 1000000
lut = {1:1}
m = 1
mv = 1
for n in xrange(1, N):
    if lut.has_key(n):
        continue
    ch = [n]
    nx = n
    while True:
        if nx % 2 == 0:
            nx /= 2
        else:
            nx = 3 * nx + 1
        if lut.has_key(nx):
            for x in ch[::-1]:
                lut[x] = lut[nx] + 1
                nx = x
            if ch[0] < N and lut[ch[0]] > m:
                m = lut[ch[0]]
                mv = ch[0]
            break
        ch.append(nx)
print mv
