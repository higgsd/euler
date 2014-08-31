-- 180180
import Data.List(group)
import Euler(primeFactors)

nn = 1000

-- 1/x + 1/y = 1/n
-- nx + ny = xy
-- Ax^2 + Bxy + Cy^2 + Dx + Ey + F = 0
-- A=0, B=-1, C=0, D=n, E=n, F=0
-- (-x + n)(-y + n) = n^2
-- solutions at:
--   di = positive and negative divisors of n^2
--   x = (di - n) / -1
--   y = ((n^2 / di) - n) / -1
-- integer solutions when di divides n^2, i.e. always
-- x positive when n > di
-- y positive when 1 > n / di
-- y is primary constraint, di = negative
-- order matters, y > x
-- number of solutions = 1/2 number of divisors of n^2
-- num divisors = sigma0(n)
-- sigma0(n) = product over prime divisors [prime power + 1]
-- sigma0(n^2) = product over prime divisors [2 * prime power + 1]
-- 24^2 = (2^3 * 3^1)^2, sigma0(n^2) = (2*3+1)(2*1+1) = 21

genSigmas [] = []
genSigmas (n:ns)
    | any (> maximum primes) fs = genSigmas ns
    | otherwise = (x,n) : genSigmas ns
    where primes = [2,3,5,7,11,13,17]
          fs = primeFactors n primes
          as = map length $ group fs
          x = product $ map (\a -> 2*a+1) as

findSolution = snd $ head $ dropWhile (\x -> fst x <= nn*2) $ genSigmas [1..]

main = putStrLn $ show $ findSolution
