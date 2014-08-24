# 171
days = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
#       j   f   m   a   m   j   j   a   s   o   n   d
sundays = 0
weekday = 1
for year in xrange(1900, 2001):
    for month in xrange(12):
        if year >= 1901 and weekday == 0:
            sundays += 1
        weekday += days[month]
        if month == 1 and year % 4 == 0 and \
            (year % 100 != 0 or year % 400 == 0):
            weekday += 1
        weekday %= 7
print sundays
