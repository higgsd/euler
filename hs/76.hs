-- 190569291
import Euler(countParts)

nn = 100

-- "100" is not a valid partition for this problem
numParts n = countParts n - 1

main = putStrLn $ show $ numParts nn
