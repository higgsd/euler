-- 45228
import Data.List(nub)
import Euler(digitUsage)

isPandigital a b = digitUsage 123456789 == digitUsage n
    where n :: Int
          n = read $ show a ++ show b ++ show (a*b)

allPandigital = [ a * b | a <- [1..10000],
                          b <- [a+1 .. 10000 `div` a+1], isPandigital a b ]

main = putStrLn $ show $ sum $ nub $ allPandigital
