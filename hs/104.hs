-- 329468
import Euler(digitUsage)

genLowerFib0 n a b = (n,c) : genLowerFib0 (n+1) b c
    where c = (a + b) `mod` (10^9)
genLowerFib = (0,0):(1,1):(2,1):genLowerFib0 3 1 1

calcUpperFib n = f
    where phi = (1 + sqrt 5) / 2
          logPhi = logBase 10 phi
          logSqrt5 = logBase 10 $ sqrt 5
          x = (fromIntegral n) * logPhi - logSqrt5
          p = x - fromIntegral (floor x) + 8
          f = round $ 10 ** p

findFib = map fst $ filter (\(_,n) -> isPandigital n) genUpperFib
    where isPandigital n = digitUsage 123456789 == digitUsage n
          genUpperFib = map (\n -> (n, calcUpperFib n)) getFibK
          getFibK = map fst $ filter (\(_,n) -> isPandigital n) genLowerFib

main = putStrLn $ show $ head $ findFib
