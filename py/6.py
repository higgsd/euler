# 25164150
ssq = 0
sqs = 0
for n in xrange(1, 101):
    ssq += n * n
    sqs += n
sqs *= sqs
print sqs - ssq
