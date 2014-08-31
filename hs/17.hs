-- 21124

name n
    | n >= 1000 =
        name (n `div` 1000) ++ "thousand" ++ name (n `mod` 1000)
    | n >= 100 && n `mod` 100 == 0 =
        name (n `div` 100) ++ "hundred"
    | n > 100 =
        name (n `div` 100) ++ "hundredand" ++ name (n `mod` 100)
    | n == 90 = "ninety"
    | n == 80 = "eighty"
    | n == 70 = "seventy"
    | n == 60 = "sixty"
    | n == 50 = "fifty"
    | n == 40 = "forty"
    | n == 30 = "thirty"
    | n == 20 = "twenty"
    | n > 20 = name (n - (n `mod` 10)) ++ name (n `mod` 10)
    | n == 19 = "nineteen"
    | n == 18 = "eighteen"
    | n == 17 = "seventeen"
    | n == 16 = "sixteen"
    | n == 15 = "fifteen"
    | n == 14 = "fourteen"
    | n == 13 = "thirteen"
    | n == 12 = "twelve"
    | n == 11 = "eleven"
    | n == 10 = "ten"
    | n == 9 = "nine"
    | n == 8 = "eight"
    | n == 7 = "seven"
    | n == 6 = "six"
    | n == 5 = "five"
    | n == 4 = "four"
    | n == 3 = "three"
    | n == 2 = "two"
    | n == 1 = "one"
    | otherwise = ""

main = putStrLn $ show $ sum $ map (length . name) [1..1000]
