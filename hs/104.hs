-- 329468
import Euler(digitUsage)

-- fibonacci calculation is too slow
-- only inspect lower digits with modulous
genLowerFib0 n a b = (n,c) : genLowerFib0 (n+1) b c
    where c = (a + b) `mod` (10^9)
genLowerFib = (0,0):(1,1):(2,1):genLowerFib0 3 1 1

-- extract upper digits directly
-- as per MathWorld, FibN = phi ^ n / sqrt 5
-- fractional part of log10 represents leading digits
-- calculate 10 ^ (t+8) to get 9 leading digits
calcUpperFib n = f
    where phi = (1 + sqrt 5) / 2
          logPhi = logBase 10 phi
          logSqrt5 = logBase 10 $ sqrt 5
          x = (fromIntegral n) * logPhi - logSqrt5
          t = x - fromIntegral (floor x)
          f = round $ 10 ** (t + 8)

findFib = map fst $ filter (\(_,n) -> isPandigital n) genUpperFib
    where isPandigital n = digitUsage 123456789 == digitUsage n
          genUpperFib = map (\n -> (n, calcUpperFib n)) getFibK
          getFibK = map fst $ filter (\(_,n) -> isPandigital n) genLowerFib

main = putStrLn $ show $ head $ findFib
