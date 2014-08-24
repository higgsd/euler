# 162
import euler
m = 0
s = {}
for word in euler.load_word_file('../files/words.txt'):
    v = euler.word_score(word)
    if s.has_key(v):
        s[v] += 1
    else:
        s[v] = 1
    if v > m:
        m = v

t = 0
n = 1
tn = 1
while tn <= m:
    if s.has_key(tn):
        t += s[tn]
    n += 1
    tn = n * (n + 1) / 2
print t
