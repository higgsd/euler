-- 20313839404245
import Data.Function(on)
import Data.List(sortBy)
import Euler(isSpecialSumSet)

-- search for solutions near the near-match algorithm results
ss = [20, 31, 38, 39, 40, 42, 45]

genSets0 [] ys = [ys]
genSets0 (x:xs) ys = concat [genSets0 xs (ys ++ [y]) | y <- [x-2,x-1..x+2]]
genSets xs = sortBy (compare `on` sum) $ genSets0 xs []

bestSet s = head $ filter isSpecialSumSet $ genSets s

main = putStrLn $ concatMap show $ bestSet ss
