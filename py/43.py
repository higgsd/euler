# 16695334890
import math
import euler

s = 0
for a in xrange(1, 999/17):
    aa = euler.digit_usage(a * 17, 3)
    for b in xrange(1, 999/13):
        if (a * 17) / 10 != (b * 13) % 100:
            continue
        for c in xrange(1, 999/11):
            if (b * 13) / 10 != (c * 11) % 100:
                continue
            for d in xrange(1, 999/7):
                if (c * 11) / 10 != (d * 7) % 100:
                    continue
                dd = euler.digit_usage(d * 7, 3)
                if aa & dd != 0:
                    continue
                for e in xrange(1, 999/5):
                    if (d * 7) / 10 != (e * 5) % 100:
                        continue
                    for f in xrange(1, 999/3):
                        if (e * 5) / 10 != (f * 3) % 100:
                            continue
                        for g in xrange(999/2):
                            if (f * 3) / 10 != (g * 2) % 100:
                                continue
                            gg = euler.digit_usage(g * 2, 3)
                            if aa & gg != 0 or dd & gg != 0:
                                continue
                            nn = (aa | dd | gg) ^ int('1111111111', 2)
                            h = math.log(nn, 2)
                            if h != int(h):
                                continue
                            n = int('%d%03d%03d%03d' % (h, g * 2, d * 7, a * 17))
                            s += n
print s
