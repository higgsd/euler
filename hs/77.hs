-- 71
import Euler(allPrimes, countPartsRestricted)

nn = 5000

primePart n = length $ takeWhile (n>) $ countPartsRestricted allPrimes

main = putStrLn $ show $ primePart nn
