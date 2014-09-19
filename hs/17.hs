-- 21124
nn = 1000

nameLen n
    | n1000 >= 1 = nameLen n1000 + length "thousand" + nameLen d1000
    | n100 >= 1 && d100 /= 0 = nameLen (n-d100) + length "and" + nameLen d100
    | n100 >= 1 = nameLen n100 + length "hundred"
    | n == 90 = length "ninety"
    | n == 80 = length "eighty"
    | n == 70 = length "seventy"
    | n == 60 = length "sixty"
    | n == 50 = length "fifty"
    | n == 40 = length "forty"
    | n == 30 = length "thirty"
    | n == 20 = length "twenty"
    | n > 20 = nameLen (n-d10) + nameLen d10
    | n == 19 = length "nineteen"
    | n == 18 = length "eighteen"
    | n == 17 = length "seventeen"
    | n == 16 = length "sixteen"
    | n == 15 = length "fifteen"
    | n == 14 = length "fourteen"
    | n == 13 = length "thirteen"
    | n == 12 = length "twelve"
    | n == 11 = length "eleven"
    | n == 10 = length "ten"
    | n == 9 = length "nine"
    | n == 8 = length "eight"
    | n == 7 = length "seven"
    | n == 6 = length "six"
    | n == 5 = length "five"
    | n == 4 = length "four"
    | n == 3 = length "three"
    | n == 2 = length "two"
    | n == 1 = length "one"
    | n == 0 = 0
    | otherwise = error "nameLen: invalid"
    where (n1000,d1000) = n `divMod` 1000
          (n100,d100) = n `divMod` 100
          d10 = n `mod` 10

countLetters n = sum $ map nameLen [1..n]

main = putStrLn $ show $ countLetters nn
