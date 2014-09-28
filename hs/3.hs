-- 6857
import Euler(primeFactors)

nn = 600851475143

largestFactor n = fst $ last $ primeFactors n

main = putStrLn $ show $ largestFactor nn
