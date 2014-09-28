-- 104743
import Euler(allPrimes)

nn = 10000

getNthPrime n = allPrimes !! n

main = putStrLn $ show $ getNthPrime nn
