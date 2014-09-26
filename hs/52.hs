-- 142857
import Euler(digitUsage)

nn = 6

firstMult n = head $ filter isPermMult allVals
    where isPermMult x = all (\y -> digitUsage x == digitUsage (x*y)) [2..n]
          allVals = concatMap (\x -> [10^x..10^(x+1) `div` n]) [1..]

main = putStrLn $ show $ firstMult nn
