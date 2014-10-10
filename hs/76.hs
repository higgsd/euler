-- 190569291
import Euler(countPartitions)

nn = 100

-- "100" is not a valid partition for this problem
numParts n = countPartitions n - 1

main = putStrLn $ show $ numParts nn
