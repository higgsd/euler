-- 40730
import Euler(toDigitsBase)

-- check from first two digit number
-- up to the maximum value that could be produced
-- 9! = 362880, no more than seven 9 digits
allFactSums = sum $ filter (\x -> x == factSum x) [10..7*factorial 9]
    where factorial n = product [2..n]
          factSum n = sum $ map factorial $ toDigitsBase 10 n

main = putStrLn $ show $ allFactSums
