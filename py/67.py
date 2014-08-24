# 7273
tri = [map(int, line.split()) for line in file('../files/triangle.txt')][::-1]
for n in xrange(1, len(tri)):
    tri[n] = [max(tri[n-1][i:i+2]) + tri[n][i] for i in xrange(len(tri) - n)]
print tri[-1][0]
