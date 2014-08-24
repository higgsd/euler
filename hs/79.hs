-- 73162890
import Data.List(nub)

keysLeft k ks = map keyLeft ks
    where keyLeft [] = []
          keyLeft (x:xs)
            | k == x = xs
            | otherwise = x:xs

nextKeys (xs,ks) = zip xs2 ks3
    where (xs2,ks2) = unzip [(x:xs, keysLeft x ks) | x <- nub $ map head ks]
          dropEmpty ys = filter (\x -> not $ null x) ys
          ks3 = map dropEmpty ks2

buildNextKeys [] = []
buildNextKeys (x:xs) = nextKeys x ++ buildNextKeys xs

getShortestKey [] = []
getShortestKey ((x,[]):_) = x
getShortestKey (_:xs) = getShortestKey xs

shortKeySearch xs
    | null key = shortKeySearch xs2
    | otherwise = key
    where xs2 = buildNextKeys xs
          key = getShortestKey xs2

findShortestKey k = reverse $ shortKeySearch [("",k)]

main = do
    contents <- readFile "../keylog.txt"
    putStrLn $ findShortestKey $ lines contents
