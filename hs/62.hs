-- 127035954683
import Data.Function(on)
import Data.List(groupBy, sort, sortBy)

nn = 5

cubes = map (^3) [1..]
cubePairs = [(sort $ show x, x) | x <- cubes]
cubeBlocks = groupBy ((==) `on` (length . fst)) cubePairs

getPerms xs = filter (\x -> length x == nn) $
        groupBy ((==) `on` fst) $ sortBy (compare `on` fst) xs

findPerm [] = error "unreachable"
findPerm (x:xs) = getPerms x ++ findPerm xs

main = putStrLn $ show $ minimum $ map snd $ head $ findPerm $ cubeBlocks
