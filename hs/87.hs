-- 1097343
import Data.List(sort, group)
import Euler(intSqrt, primeSieve)

nn = 50000000
primes = primeSieve $ intSqrt nn

genTriples n p v
    | p == 2 = map (\x -> nn - v + x^p) genFactors
    | otherwise = concatMap genNext genFactors
    where genFactors = takeWhile (\x -> x^p < v) primes
          genNext x = genTriples n (p-1) (v - x^p)

main = putStrLn $ show $ length $ group $ sort $ genTriples nn 4 nn
