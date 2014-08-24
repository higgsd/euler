-- 31626
import Euler

factorSum n = sum $ drop 1 $ reverse $ allFactors n
isAmicable a = a /= b && a == db
    where b = factorSum a
          db = factorSum b
sumAmicable n = sum $ [ x | x <- [2..n], isAmicable x ]

main = putStrLn $ show $ sumAmicable 10000
