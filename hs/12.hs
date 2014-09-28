-- 76576500
import Euler(divisorPowerSum, triangular)

nn = 500

-- divisorPowerSum 0 is the number of divisors
findTri n = head $ filter (\x -> divisorPowerSum 0 x > n) triangular

main = putStrLn $ show $ findTri nn
