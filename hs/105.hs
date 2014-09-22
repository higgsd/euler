-- 73702
import Euler(isSpecialSumSet, splitOn)

parseSets [] = []
parseSets (x:xs) = ss : parseSets xs
    where ss = map read $ splitOn ',' x

sumSpecialSets ws = sum $ concat spec
    where sets = parseSets ws
          spec = filter isSpecialSumSet sets

main = do
    contents <- readFile "../files/p105_sets.txt"
    putStrLn $ show $ sumSpecialSets $ lines contents
