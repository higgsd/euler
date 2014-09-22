-- 16475640049
import Euler(nChooseK)

mm = 3
nn = 50

-- generalized solution for 114 and 115
-- probed first 10 results for mm = 3,4,5 w/ manual discovery
-- recovered all solutions from OEIS (A005252, A005253, A005689)
-- combined binomial coefficient formulas
countBlocks m n = sum [nChooseK (n+1-k*(m-1)) (k*2) |
                       k <- [0..(n+1) `div` (m+1)]]

main = putStrLn $ show $ countBlocks mm nn
