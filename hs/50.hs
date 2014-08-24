-- 997651
import Data.Array(listArray, (!), (//))
import Euler(primeSieve)

nn = 1000000
primesN = primeSieve nn
primesA = (listArray (2,nn) $ repeat False) // [(p,True) | p <- primesN]
primes = takeWhile (nn `div` 2 >) primesN
maxlen = length primes

genSum [] = []
genSum ((a,b):xs)
    | s >= nn = []
    | primesA ! s = s : genSum xs
    | otherwise = genSum xs
    where s = sum $ drop b $ take a primes

genRanges n
    | even n = [(n,0)]
    | otherwise = [ (n+i,i) | i <- [1..maxlen - n] ]

longestSum n = last $ concat $ map (genSum . genRanges) [2..n-1]

main = putStrLn $ show $ longestSum maxlen
