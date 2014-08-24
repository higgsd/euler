-- 7652413
import Data.List(sort, permutations)
import Euler(isPrimeSimple)

nn = 7

genPan n
    | n == 1 = []
    | sum [1..n] `mod` 3 == 0 = genPan (n-1)
    | otherwise = (reverse $ sort npan) ++ genPan (n-1)
    where npan = map (read . concatMap show) $ permutations [1..n]

main = putStrLn $ show $ head $ filter isPrimeSimple $ genPan nn
