-- 7652413
import Data.List(permutations, sort)
import Euler(fromDigits, isPrimeSimple)

-- sum [1..9] is divisible by three, cannot be prime
-- sum [1..8] also divisible by three, cannot be prime
-- largest pandigital prime has 7 digits
nn = 7

panPrimes 0 = []
panPrimes n = filter isPrimeSimple xs ++ ys
    where ys = panPrimes (n-1)
          xs = reverse $ sort $ map fromDigits $ permutations [1..n]

maxPrime n = head $ panPrimes n

main = putStrLn $ show $ maxPrime nn
