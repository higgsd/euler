-- 31626
import Euler(allDivisors)

factorSum n = sum $ init $ allDivisors n
isAmicable a = a /= b && a == db
    where b = factorSum a
          db = factorSum b
sumAmicable n = sum $ [ x | x <- [2..n], isAmicable x ]

main = putStrLn $ show $ sumAmicable 10000
