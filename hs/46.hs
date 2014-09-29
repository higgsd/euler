-- 5777
import Data.List.Ordered(minus)
import Math.NumberTheory.Powers.Squares(isSquare)
import Euler(allPrimes)

goldFail = head $ filter (not.isGold) $ [3,5..] `minus` allPrimes
    where isGold x = any isSquare $ map (\y -> (x-y) `div` 2) $
                     takeWhile (x>) $ drop 1 allPrimes

main = putStrLn $ show $ goldFail
