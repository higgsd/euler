-- 6857
import Euler(intSqrt, primeSieve)

largestFactor n = head [ x | x <- primes, n `mod` x == 0 ]
    where primes = reverse $ primeSieve $ intSqrt n

main = putStrLn $ show $ largestFactor 600851475143
