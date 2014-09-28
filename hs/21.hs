-- 31626
import Euler(divisorPowerSum)

nn = 10000

-- divisorPowerSum 1 is the sum of all divisors
isAmicable a = a /= b && a == factorSum b
    where b = factorSum a
          factorSum n = divisorPowerSum 1 n - n
sumAmicable n = sum $ filter isAmicable [2..n]

main = putStrLn $ show $ sumAmicable nn
