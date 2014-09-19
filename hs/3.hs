-- 6857
import Euler(intSqrt, primeSieve)

nn = 600851475143

main = putStrLn $ show $ largestFactor nn
    where largestFactor n = head $ filter (\p -> n `mod` p == 0) $
                            reverse $ primeSieve $ intSqrt n
