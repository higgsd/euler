-- 4179871
import Euler
import Data.Array(listArray, (!))

n = 28123

isAbundant x = (sum $ allFactors x) - x > x
abundantArray = listArray (1,n) $ map isAbundant [1..n]
abundants = filter (abundantArray !) [1..n]

-- map/reduce logic is faster than iteration/recursion
subAbundant x = map (x -) $ takeWhile (<= x `div` 2) abundants
isAbundantSum x = any (abundantArray !) $ subAbundant x

main = putStrLn $ show $ sum $ filter (not . isAbundantSum) [1..n]
