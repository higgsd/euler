-- 983
import Data.Function(on)
import Data.List(maximumBy)
import Euler(primeSieve, modPow)

nn = 1000

-- repetend length of 1/x is always less than x
-- since repetends of 1/pq is LCM(Tp, Tq),
-- reciprocals will be longest for 1/p where p is a prime

-- length of repetends of 1/p = multiplicative order of 10 mod p
multOrder a n = (length $ takeWhile notOrder [2..]) + 2
    where notOrder x = modPow a x n /= 1

longestRep n = maximumBy (compare `on` multOrder 10) xs
    where xs = filter (\x -> x /= 2 && x /= 5) $ primeSieve n

main = putStrLn $ show $ longestRep nn
