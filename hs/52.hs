-- 142857
import Euler(digitUsage)

nn = 6

dvalues d = [10^d..10^(d+1) `div` nn]

isPermMult n = all (\x -> digitUsage n == digitUsage (x*n)) [2..nn]

firstMult = head [ n | d <- [1..], n <- dvalues d, isPermMult n ]

main = putStrLn $ show $ firstMult
