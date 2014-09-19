-- 983
import Data.List(sort)

nn = 1000

-- cannot just check r1 == 1, for cases like 1/6
repCycle r d xs n
    | r2 == 0 = 0
    | r2 `elem` xs = d
    | otherwise = repCycle r2 (d+1) (r2:xs) n
    where r2 = r * 10 `mod` n

longestRepCycle n = snd $ last $ sort $ genRepCycle
    where genRepCycle = map (\x -> (repCycle 1 1 [1] x, x)) [2..n]

main = putStrLn $ show $ longestRepCycle nn
