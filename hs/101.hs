-- 37076114526
-- solve simultaneous equations w/ gaussian elimination

import Data.Ratio((%),numerator,denominator)

pp = [1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1]

evalCoef p x n = ((p !! n) * x^n)
evalPoly p x = sum $ map (evalCoef p x) [0..length p-1]

buildMatrix p k = [front (r%1) ++ [evalPoly p (r%1)] | r <- [1..k]]
    where front x = map (\y -> x ^ y) [0..k-1]

combRow m src f dst = a ++ [b] ++ c
    where a = take dst m
          c = drop (dst+1) m
          b = zipWith (+) b1 b2
          b1 = m !! dst
          b2 = map (*f) (m !! src)

-- put matrix in triangular form
makeTri0 m src dst
    | src >= k = m
    | dst >= k = makeTri0 mx (src+1) (src+2)
    | otherwise = makeTri0 mx src (dst+1)
    where k = length m - 1
          c1 = m !! dst !! src
          c2 = m !! src !! src
          f = (-1) * c1 / c2
          mx = combRow m src f dst
makeTri m = makeTri0 m 0 1

-- convert matrix to identity (solved)
makeIdent0 m src dst
    | src < 0 = m
    | dst < 0 = makeIdent0 m (src-1) (src-1)
    | dst == src = makeIdent0 m2 src (dst-1)
    | otherwise = makeIdent0 m1 src (dst-1)
    where c1 = m !! dst !! src
          c2 = m !! src !! src
          f1 = (-1) * c1 / c2
          f2 = (-1) * (c1 - 1) / c2
          m1 = combRow m src f1 dst
          m2 = combRow m src f2 dst
makeIdent m = makeIdent0 m k k
    where k = length m - 1

solveBOP p k
    | denominator v /= 1 = error "solveBOP: fractional result"
    | otherwise = numerator v
    where m = makeIdent $ makeTri $ buildMatrix p k
          v = evalPoly (map last m) ((k+1)%1)

sumBOP p = sum $ map (solveBOP p) [1..length p - 1]

main = putStrLn $ show $ sumBOP pp
