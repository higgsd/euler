-- 40730
import Euler(toDigitsBase)

-- check from first two digit number
-- up to the maximum value that could be produced
-- 9! = 362880, no more than seven 9 digits
allFactSums = sum $ filter (\x -> x == factSum x) [10..7*factorial 9]
    where factSum n = sum $ map factorial $ toDigitsBase 10 n

factorial n = map calcFact [0..9] !! n
    where calcFact x = product [2..x]

main = putStrLn $ show $ allFactSums
