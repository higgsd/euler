-- 840
import Data.List(group, sort)
import Euler(intSqrt)

nn = 1000

genPerims n = [a+b+c | a <- [1..n `div` 3], b <- [a..n-a `div` 2],
                       let c2 = a^2 + b^2, let c = intSqrt c2,
                       c^2 == c2, n >= a+b+c]

mostFreqPerim n = snd $ maximum $ map (\x -> (length x, head x)) $
                  group $ sort $ genPerims n

main = putStrLn $ show $ mostFreqPerim nn
