-- 402
import Data.Map.Strict((!), fromList, insert, toList)
import qualified Data.Map.Strict as M(lookup)
import Euler(digitFactorial, toDigitsBase)

-- XXX: figure out why counting target lengths as the tree is built is slower

nn = 1000000
mm = 60

-- these are the only non-singleton loops, hardcode them
xx = [(871,2), (45361,2), (872,2), (45362,2), (169,3), (36301,3), (1454,3)]

-- recursively construct a tree, mapping start values to chain lengths
-- tree is built on-demand, until it hits a singleton or known value
-- then lengths are filled in for future caching
-- later lookups may be redundant, so ignore them
updateTree t x = case M.lookup x t of
        Just _ -> t
        Nothing -> t3
    where x2 = sum $ map digitFactorial $ toDigitsBase 10 x
          t2 = updateTree t x2
          t3 = if x == x2 then insert x 1 t
               else insert x (1 + t2!x2) t2

countFactLength x n m = length $ filter (==m) $ map snd $ toList $
                        buildTree (fromList x) [1..n]
    where buildTree t [] = t
          buildTree t (y:ys) = buildTree (updateTree t y) ys

main = putStrLn $ show $ countFactLength xx nn mm
