-- 14316
import Data.List(group)
import Data.Array(listArray, bounds, (!))
import Euler(intSqrt, primeSieve)

nn = 1000000

buildNext n = listArray (2,n) [divFunction x | x <- [2..n]]

primeFactors0 n [] = [n]
primeFactors0 n (p:ps)
    | p >= n = [n]
    | n `mod` p == 0 = p : primeFactors0 (n `div` p) (p:ps)
    | otherwise = primeFactors0 n ps
primeFactors n = primeFactors0 n $ primeSieve (intSqrt nn)

divFunction n = product [sum [p^ai | ai <- [0..a]] | (a,p) <- xs] - n
    where ds = primeFactors n
          xs = zip (map length $ group ds) (map head $ group ds)

chainLength0 a s xs
    | x < (fst $ bounds a) = 0  -- outside bounds
    | x > (snd $ bounds a) = 0  -- outside bounds
    | s > n = 0                 -- already found
    | s == n = length xs        -- cycle found
    | n `elem` xs = 0           -- defer
    | otherwise = chainLength0 a s (n:xs)
    where x = head xs
          n = a ! x
chainLength n x = chainLength0 (buildNext n) x [x]

bestChainLength n = maximum [(chainLength n x, x) | x <- [1..nn]]

main = putStrLn $ show $ snd $ bestChainLength nn
