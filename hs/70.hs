-- 8319823
import Euler
import Data.List(sort)

-- lowest phi will be produced by multiplying two primes closest to nn
-- reduce search space by only considering primes "near" sqrt(nn)
nn = 10 ^ 7
ff = intSqrt nn `div` 10
primes = dropWhile (ff>) $ primeSieve $ nn `div` ff

-- phi(n) = n * PRODUCT [p|n] (1 - 1/p)
-- where p are all prime factors of n
phi xs = (product xs) * num `div` den
    where num = product $ map (\x -> x - 1) xs
          den = product xs

phiRatio xs = (fromIntegral $ product xs) / (fromIntegral $ phi xs)

isPerm n m = (sort $ show n) == (sort $ show m)

allPhi2Perms = [ (phiRatio xs, n) | a <- primes, b <- primes, let xs = [a,b],
                 let n = product xs, nn > n, isPerm n $ phi xs ]

main = putStrLn $ show $ snd $ minimum $ allPhi2Perms
