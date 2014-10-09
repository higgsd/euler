-- 40730
import Euler(digitFactorial, toDigitsBase)

-- check from first two digit number
-- up to the maximum value that could be produced
-- 9! = 362880, no more than seven 9 digits
allFactSums = sum $ filter (\x -> x == factSum x) [10..7*digitFactorial 9]
    where factSum n = sum $ map digitFactorial $ toDigitsBase 10 n

main = putStrLn $ show $ allFactSums
