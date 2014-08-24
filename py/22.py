# 871198282
import euler
names = euler.load_word_file('../files/names.txt')
names.sort()
s = 0
for i in xrange(len(names)):
    s += (i + 1) * euler.word_score(names[i])
print s
