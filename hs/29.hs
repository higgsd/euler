-- 9183
import Data.List.Ordered(unionAll)

nn = 100

-- sorted union is faster than regular nub
distinctPowers n = length $ unionAll [map (x^) [2..n] | x <- [2..n]]

main = putStrLn $ show $ distinctPowers nn
