-- 21035
import Data.List(genericIndex, genericLength)
import Euler(primeSieve)

-- desired remainder not found within 10^5, tried 10^6
mm = 10^6
nn = 10^10
primes = primeSieve mm

calcR n
    | even n = 2
    | otherwise = (2*p*n) `rem` (p*p)
    where p = primes `genericIndex` (n-1)

targetN = (length $ takeWhile (nn >=) rs) + 1
    where rs = map calcR [1..genericLength primes]

main = putStrLn $ show $ targetN
