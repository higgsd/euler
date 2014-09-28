-- 4179871
import Data.Array((!), array)
import Euler(divisorPowerSum)

nn = 28123

-- divisorPowerSum is the sum of all divisors
-- generate array of abundant numbers
-- to check, see if subtracting any abundant produces another abundant
sumNonSums n = sum $ filter (not.isAbSum) [1..n]
    where ar = array (1,n) $ map (\x -> (x, isAb x)) [1..n]
          isAb x = divisorPowerSum 1 x > 2*x
          subAb x = map (x-) $ takeWhile (<= x `div` 2) $ filter (ar!) [1..n]
          isAbSum x = any (ar!) $ subAb x

main = putStrLn $ show $ sumNonSums nn
