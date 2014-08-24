-- 55
import Euler
import Data.Array(listArray, (!), (//))

nn = 1000000

buildCircular _ _ [] = error "unreachable"
buildCircular s ns (x:xs)
    | s == s2 = ns
    | otherwise = buildCircular s (read s2:ns) s2
    where s2 = xs ++ [x]

allCircular n = buildCircular s [n] s
    where s = show n

isCircularPrime n pa = all (pa !) $ allCircular n

allCircularPrimes n = [ p | p <- primes, isCircularPrime p pa ]
    where primes = primeSieve n
          pa = (listArray (0,n) $ repeat False) // [(x,True) | x <- primes]

main = putStrLn $ show $ length $ allCircularPrimes nn
