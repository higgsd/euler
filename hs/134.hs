-- 18613426663617118
import Euler(primeSieve)

nn = 10^6

primePairs = filter (\(x,_) -> x >= 5 && nn >= x) $ zip ps (drop 1 ps)
    where ps = primeSieve $ nn + 50

-- extended euclidean reduction algorithm
-- GCD already known to be 1, because p2 > 5
-- solve bx + qp2 = 1 for x, ignore q
extEuclid0 (r0,s0,t0) rst@(r1,s1,t1)
    | r2 == 1 = s2
    | otherwise = extEuclid0 rst (r2,s2,t2)
    where (q,r2) = r0 `quotRem` r1
          s2 = s0 - s1*q
          t2 = t0 - t1*q
extEuclid a b = extEuclid0 (a,1,0) (b,0,1)

-- (bx + p1) mod p2 = 0 => bx mod p2 = p2 - p1
-- bx + qp2 = p2 - p1 for some x and q
-- solve w/ extended euclid
-- multiply result by (p2 - p1) and apply modulus
solveRelation (p1,p2) = x*b + p1
    where b = 10 ^ (ceiling $ logBase 10 $ fromIntegral p1)
          x = (p2-p1) * (extEuclid b p2) `mod` p2

main = putStrLn $ show $ sum $ map solveRelation primePairs
