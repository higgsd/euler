-- -59231
import Data.List(sort)
import Data.Array((!), (//), listArray)
import Euler(primeSieve)

nn = 1000

primeSeqLen a b n = length $ takeWhile isPrime $ map poly [0..]
    where poly x = x*x + a*x + b
          isPrime x = x > 2 && primeArray ! x
          primeArray = emptyArray // [(p,True) | p <- primeSieve n]
          emptyArray = listArray (1,n) $ repeat False

findBestPoly n = snd $ last $ sort $ [(primeSeqLen a b v, a*b) |
                                      a <- [1-n,2-n..n-1], b <- [2..n-1]]
    where v = 2*n^2 + n

main = putStrLn $ show $ findBestPoly nn
