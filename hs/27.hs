-- -59231
import Data.Function(on)
import Data.List(maximumBy)
import Data.Array((!), (//), listArray)
import Euler(primeSieve)

nn = 1000

primeSeqLen p (a,b) = length $ takeWhile isPrime $ map poly [0..]
    where poly x = x*x + a*x + b
          isPrime x = x>2 && p!x

-- when x = 0, poly = b => b must be prime
-- when x = 2, poly = 4 + 2a + b, => if b is 2, prime sequence ends quickly
-- when x = 1, poly = 1 + a + b, => when b is odd, a must be odd
findBestPoly n = (\(x,y) -> x*y) $ maximumBy (compare `on` primeSeqLen r) $
                 [(a,b) | a <- [1-n,3-n..n-1], b <- drop 1 $ primeSieve n]
    where v = 2*n^2 + n
          r = (listArray (1,v) $ repeat False) // [(p,True) | p <- primeSieve v]

main = putStrLn $ show $ findBestPoly nn
