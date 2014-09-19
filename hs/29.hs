-- 9183
import Data.List(nub)

nn = 100

distinctPowers n = length $ nub [a^b | a <- [2..n], b <- [2..n]]

main = putStrLn $ show $ distinctPowers nn
