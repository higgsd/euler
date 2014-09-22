-- 840
import Data.List(group, sort)

nn = 1000

genPerims n = [a+b+c | a <- [1..n `div` 3], b <- [a..n-a `div` 2],
                       let c2 = a*a + b*b,
                       let c = floor $ sqrt $ fromIntegral c2,
                       c*c == c2, n >= a+b+c]

mostFreqPerim n = snd $ maximum $ map (\x -> (length x, head x)) $
                  group $ sort $ genPerims n

main = putStrLn $ show $ mostFreqPerim nn
