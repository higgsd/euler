-- 100
import Data.Ratio(denominator, (%))
import Euler(digitUsage)

isReduceable n d
    | sum cc /= 1 || cc !! 0 == 1 || d2 == 0 = False
    | otherwise = n % d == n2 % d2
    where nn = digitUsage n
          dd = digitUsage d
          cc = zipWith min nn dd
          n2 = length $ takeWhile (==0) $ zipWith (-) nn cc
          d2 = length $ takeWhile (==0) $ zipWith (-) dd cc

allFracts = [ n % d | n <- [11..99],
                      d <- [n+1..99], isReduceable n d ]

main = putStrLn $ show $ denominator $ product $ allFracts
