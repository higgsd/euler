-- 997651
import Data.Array((!), (//), listArray)
import Euler(primeSieve)

nn = 1000000

-- instead of summing lots of sequences, build cumulative array
-- sum(a to b) = cum(b) - cum(a)
-- use arrays because there's lots of random access
-- construct sums of increasing lengths and sizes
-- with each length, stop when size exceeds maximum
-- then retrieve the final valid sum in the list

getSums ca np n k
    | k > np = []
    | otherwise = ys ++ xs
    where calcSum x = ca ! (k+x) - ca!x
          ys = takeWhile (n>) $ map calcSum $ if even k then [0] else [1..np-k]
          xs = getSums ca np n (k+1)

longestSum n = last $ filter (pa!) $ getSums ca np n 1
    where ps = primeSieve n
          np = length ps
          pa = listArray (2,n) (repeat False) // [(p,True) | p <- ps]
          ca = listArray (0,np) (scanl (+) 0 ps)

main = putStrLn $ show $ longestSum nn
