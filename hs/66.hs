-- 661
import Data.Function(on)
import Data.List(maximumBy)
import Euler(expConvergents, sqrtExpansion)

nn = 1000

-- when solving x^2-Dy^2 = 1 (Pell's Equation)
-- wikipedia says the smallest x is found by evaluating
-- the convergents of sqrt(D) until a solution is found

solveDio d
    | null xs = 0
    | otherwise  = fst $ head $ filter isSolution $ expConvergents (n,xs)
    where (n,xs) = sqrtExpansion d
          isSolution (x,y) = x^2 - d*y^2 == 1

maxDio n = maximumBy (compare `on` solveDio) [2..n]

main = putStrLn $ show $ maxDio nn
