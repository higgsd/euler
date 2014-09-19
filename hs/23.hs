-- 4179871
import Data.Array(array, (!))
import Euler(intSqrt, primeSieve, allDivisorsP)

nn = 28123

-- generate array of abundant numbers
-- to check, see if subtracting any abundant produces another abundant
sumNonSums n = sum $ filter (not.isAbSum) [1..n]
    where ar = array (1,n) $ map (\x -> (x, isAb x)) [1..n]
          isAb x = (sum $ init $ allDivisorsP ps x) > x
          subAb x = map (x-) $ takeWhile (<= x `div` 2) $ filter (ar!) [1..n]
          isAbSum x = any (ar!) $ subAb x
          ps = primeSieve $ intSqrt n

main = putStrLn $ show $ sumNonSums nn
