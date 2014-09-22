-- 55
import Data.Array((!), (//), listArray)
import Euler(fromDigits, primeSieve, toDigitsBase)

nn = 1000000

genCircular n = map (\x -> fromDigits $ take k $ drop x $ cycle ds) [1..k]
    where ds = toDigitsBase 10 n
          k = length ds

countCircularPrimes n = length $ filter isCircularPrime primes
    where primes = primeSieve n
          a = (listArray (2,n) $ repeat False) // [(x,True) | x <- primes]
          isCircularPrime p = all (a!) $ genCircular p

main = putStrLn $ show $ countCircularPrimes nn
