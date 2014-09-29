-- 134043
import Data.List(genericIndex, genericLength)
import Data.List.Ordered(minus)
import Euler(allPrimes, primeFactors)

nn = 4

findSeqFactors n = matchSeq findFactors
    where matchSeq [] = error "matchSeq: empty"
          matchSeq (x:xs) = if xs `genericIndex` (n-2) == x+n-1
                            then x else matchSeq xs
          findFactors = filter hasFactors $ [2..] `minus` allPrimes
          hasFactors x = (genericLength $ primeFactors x) == n

main = putStrLn $ show $ findSeqFactors nn
