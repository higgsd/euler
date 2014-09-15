-- 173
import Euler(isPrimeSimple)

-- results are differences of two consecutive cubes
-- http://www.mathblog.dk/project-euler-131-primes-perfect-cube/

nn = 1000000

genPartners = takeWhile (nn>) $ filter isPrimeSimple genDiffs
    where genDiffs = genDiffs0 2 (1^3)
          genDiffs0 n p = (n^3 - p) : genDiffs0 (n+1) (n^3)

main = putStrLn $ show $ length genPartners
