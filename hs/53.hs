-- 4075
import Euler(nChooseK)

vv = 1000000
nn = 100

numCombs v n = length $ filter (>v) [nChooseK r k | k <- [1..n], r <- [k..n]]

main = putStrLn $ show $ numCombs vv nn
