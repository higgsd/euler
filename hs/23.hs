-- 4179871
import Data.Array((!), listArray)
import Euler(divisorPowerSum)

nn = 28123

-- divisorPowerSum is the sum of all divisors
-- subtract self to check if a number is abundant
isAbundant x = divisorPowerSum 1 x > 2*x

-- generate array of abundant numbers
-- to check, see if subtracting any abundant produces another abundant
sumNonSums n = sum $ filter (not.isAbSum) [1..n]
    where a = listArray (1,n) $ map isAbundant [1..n]
          subAb x = map (x-) $ takeWhile (<= x `div` 2) $ filter (a!) [1..n]
          isAbSum x = any (a!) $ subAb x

main = putStrLn $ show $ sumNonSums nn
