-- 73702
import Euler(splitOn,isSpecialSumSet)

parseSets [] = []
parseSets (x:xs) = ss : parseSets xs
    where ss = map read $ splitOn ',' x

sumSpecialSets ws = sum $ concat spec
    where sets = parseSets ws
          spec = filter isSpecialSumSet sets

main = do
    contents <- readFile "../p105_sets.txt"
    putStrLn $ show $ sumSpecialSets $ lines contents
