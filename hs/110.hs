-- 9350130049860600
import Euler(allPrimes, divisorPowerSum)

nn = 4000000

-- same method as 108, larger target
findSolution n = head $ filter hasNSolutions cs
    where k = head $ filter (\x -> 3^x > n) [1..]
          cs = map (\x -> x * (product $ take (k-2) allPrimes)) [1..]
          hasNSolutions x = divisorPowerSum 0 (x^2) > n*2

main = putStrLn $ show $ findSolution nn
