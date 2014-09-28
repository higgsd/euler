-- 180180
import Euler(allPrimes, divisorPowerSum)

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
-- each unique divisor of n increases sigma0(n^2) by 3
-- because sigma0(n^2) = product of [2 * power + 1]
-- use smallest divisors, number based on 3^n vs solution count
-- construct candidates from prime multiples

findSolution n = head $ filter hasNSolutions cs
    where k = head $ filter (\x -> 3^x > n) [1..]
          cs = map (\x -> x * (product $ take (k-2) allPrimes)) [1..]
          hasNSolutions x = divisorPowerSum 0 (x^2) > n*2

main = putStrLn $ show $ findSolution nn
