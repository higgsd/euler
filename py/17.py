# 21124
ones = {0: '', 1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five',
        6: 'six', 7: 'seven', 8: 'eight', 9: 'nine', 10: 'ten',
        11: 'eleven', 12: 'twelve', 13: 'thirteen',
        14: 'fourteen', 15: 'fifteen', 16: 'sixteen',
        17: 'seventeen', 18: 'eighteen', 19: 'nineteen'}
tens = {2: 'twenty', 3: 'thirty', 4: 'forty', 5: 'fifty',
        6: 'sixty', 7: 'seventy', 8: 'eighty', 9: 'ninety'}

sum = 0
for n in xrange(1, 1001):
    word = ''
    if n >= 1000:
        word += ones[n/1000] + 'thousand'
        n %= 1000
    if n >= 100:
        word += ones[n/100] + 'hundred'
        n %= 100
        if n > 0:
            word += 'and'
    if n >= 20:
        word += tens[n/10]
        n %= 10
    word += ones[n]
    sum += len(word)
print sum
