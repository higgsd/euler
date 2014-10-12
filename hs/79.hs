-- 73162890
import Data.List(group, nub, sort)

unmatchedKey _ [] = []
unmatchedKey [] ks = ks
unmatchedKey ps key@(k:ks)
    | null ps2 = key
    | otherwise = unmatchedKey (tail ps2) ks
    where ps2 = dropWhile (/=k) ps

-- recursively find the shortest key by constructing all possible pins
-- takes a list of keys and a list of candidate PINs (strings)
-- greedy depth-first algorithm would run much faster, but may not be shortest
-- does not assume PIN contents are not repeated 
findKey ks ps
    | null sols = findKey ks (concatMap addNext rs)
    | otherwise = head $ map fst sols
    where getUnmatched p = (p, map (unmatchedKey p) ks)
          rs = map getUnmatched ps
          sols = filter (all null.snd) rs
          addNext (p,xs) = map (\x -> p++[x]) $ map head $ group $ sort $
                           map head $ filter (not.null) xs

-- some lines are repeated, ignore them
findShortestKey s = findKey (nub $ lines s) [""]

main = do
    s <- readFile "../files/keylog.txt"
    putStrLn $ findShortestKey s
