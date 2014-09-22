-- 100
import Data.Ratio((%), denominator)
import Euler(digitUsage)

kk = 2

-- must have a single digit in common
-- two digits in common would either be one or cancel to one
-- that digit cannot be zero
-- remaining fraction cannot divide by zero
isReduceable n d
    | sum cc /= 1 || cc !! 0 == 1 || d2 == 0 = False
    | otherwise = n % d == n2 % d2
    where nn = digitUsage n
          dd = digitUsage d
          cc = zipWith min nn dd
          n2 = length $ takeWhile (==0) $ zipWith (-) nn cc
          d2 = length $ takeWhile (==0) $ zipWith (-) dd cc

calcFracResult k = denominator $ product
        [n % d | n <- [10^(k-1)..10^k-1], d <- [n+1..10^k-1], isReduceable n d]

main = putStrLn $ show $ calcFracResult kk
