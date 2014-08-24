-- 40730

factorial n = product [2..n]

factSum n = sum $ map factDigit $ show n
    where factDigit c = factorial $ read [c]

allFactSums = [ n | n <- [11 .. 7 * factorial 9], n == factSum n]

main = putStrLn $ show $ sum $ allFactSums
