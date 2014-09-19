-- 6857
import Euler(intSqrt, primeSieve)

nn = 600851475143

largestFactor n = head $ filter (\p -> n `mod` p == 0) $
                  reverse $ primeSieve $ intSqrt n

main = putStrLn $ show $ largestFactor nn
