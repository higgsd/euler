-- 843296
import Data.List(nub, sort, subsequences)
import Euler(primeFactorsP, primeSieve)

nn = 10^9
kk = 40

-- trial divisions and maximum prime found by trial and error
tt = 60
mm = 2*10^5
pp = primeSieve mm

-- As per Wikipedia, R(n) is the product of the cyclotomic polynomials over all
-- divisors of n, evaluated at ten, divided by nine.  Since O1(10) is nine, the
-- division is ignored.

divisors = nub $ sort $ map product $ subsequences $ primeFactorsP [2,5] nn
repFactors = take tt $ map (cyclotomic 10) (drop 1 divisors)
repPrimes = sort $ filter (mm>) $ concatMap (primeFactorsP pp) repFactors

-- assumes n is a product of either 2 or 5, in any quantity
cyclotomic x n
    | n == 2 = x + 1
    | n == 5 = x^4 + x^3 + x^2 + x + 1
    | n `mod` 2 /= 0 = cyclotomic (x^5^(pow5 n - 1)) 5
    | n `mod` 5 /= 0 = cyclotomic (x^2^(pow2 n - 1)) 2
    | even n && even n2 = cyclotomic (x^2) n2
    | even n && odd n2 = cyclotomic (-x) n2
    | otherwise = error "cyclotomic: unknown"
    where pow2 y = if y == 2 then 1 else 1 + (pow2 $ y `div` 2)
          pow5 y = if y == 5 then 1 else 1 + (pow5 $ y `div` 5)
          n2 = n `div` 2

main = putStrLn $ show $ sum $ take kk repPrimes
