-- 127035954683
import Data.Function(on)
import Data.List(groupBy, sort, sortBy)
import Euler(toDigitsBase)

nn = 5

findPerms0 n xs = if length ps /= 0 then ps else findPerms0 n (tail xs)
    where ps = filter (\ys -> length ys == n) $ groupBy ((==) `on` snd) $
                      sortBy (compare `on` snd) $ head xs

bestPermValue n = minimum $ map fst $ concat $ findPerms
    where findPerms = findPerms0 n $ groupBy ((==) `on` length.snd) $
                      map (\x -> (x, sort $ toDigitsBase 10 x)) $ map (^3) [1..]

main = putStrLn $ show $ bestPermValue nn
