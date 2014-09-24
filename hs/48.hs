-- 9110846700
import Euler(modPow)

nn = 1000
kk = 10

sumSelfPowers n k = s `mod` p
    where p = 10^k
          s = sum [modPow x x p | x <- [1..n]]

main = putStrLn $ show $ sumSelfPowers nn kk
