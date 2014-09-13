-- 21417
import Data.Function(on)
import Data.List(sortBy)
import Euler(radicalSieve)

nn = 100000
kk = 10000
rr = radicalSieve nn

getRad k = fst $ rs !! k
    where rs = sortBy (compare `on` snd) rr

main = putStrLn $ show $ getRad kk
