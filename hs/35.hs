-- 55
import Data.Array((!), (//), listArray)
import Euler(primeSieve, getDigitsBase)

nn = 1000000

genCircular n = map (\x -> buildNum $ take k $ drop x $ cycle ds) [1..k]
    where ds = getDigitsBase 10 n
          k = length ds
          buildNum [] = 0
          buildNum (x:xs) = x + 10*buildNum xs

countCircularPrimes n = length $ filter isCircularPrime primes
    where primes = primeSieve n
          a = (listArray (2,n) $ repeat False) // [(x,True) | x <- primes]
          isCircularPrime p = all (a!) $ genCircular p

main = putStrLn $ show $ countCircularPrimes nn
