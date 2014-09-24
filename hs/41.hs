-- 7652413
import Data.List(permutations, sort)
import Euler(fromDigits, isPrimeSimple)

nn = 7

panPrimes 0 = []
panPrimes n = filter isPrimeSimple xs ++ ys
    where ys = panPrimes (n-1)
          xs = reverse $ sort $ map fromDigits $ permutations [1..n]

maxPrime n = head $ panPrimes n

main = putStrLn $ show $ maxPrime nn
