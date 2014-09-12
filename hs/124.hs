-- 21417
import Data.Function(on)
import Data.List(sortBy)
import Euler(radicalSieve)

nn = 100000
kk = 10000
rr = radicalSieve nn

enumerate0 _ [] = []
enumerate0 n (x:xs) = (n,x) : enumerate0 (n+1) xs
enumerate xs = enumerate0 0 xs

getRad k = fst $ rs !! k
    where rs = sortBy (compare `on` snd) $ enumerate rr

main = putStrLn $ show $ getRad kk
