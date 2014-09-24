-- 5777
import Data.List.Ordered(minus)
import Euler(allPrimes, intSqrt)

goldFail = head $ filter (not.isGold) $ [3,5..] `minus` allPrimes
    where isSquare x = x == (intSqrt x)^2
          isGold x = any isSquare $ map (\y -> (x-y) `div` 2) $
                     takeWhile (x>) $ drop 1 allPrimes

main = putStrLn $ show $ goldFail
