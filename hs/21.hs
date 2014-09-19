-- 31626
import Euler(allDivisors)

nn = 10000

isAmicable a = a /= b && a == factorSum b
    where factorSum n = sum $ init $ allDivisors n
          b = factorSum a
sumAmicable n = sum $ filter isAmicable [2..n]

main = putStrLn $ show $ sumAmicable nn
