-- 21417
import Data.Function(on)
import Data.List(nub, sortBy)
import Euler(primeSieve, primeFactors)

nn = 100000
kk = 10000
pp = primeSieve nn

rad n = (n, product $ nub $ primeFactors n pp)

getRad k = fst $ rs !! (k-1)
    where rs = sortBy (compare `on` snd) $ map rad [1..nn]

main = putStrLn $ show $ getRad kk
