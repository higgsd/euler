-- 2906969179
import Data.List(nub)

nn = 10^8

sumSq k = map (\n -> sum $ take k $ snd $ splitAt n sq) [0..]
    where sq = map (^2) [1..]

allSums0 k = if null ns then [] else ns ++ allSums0 (k+1)
    where ns = takeWhile (nn>) (sumSq k)

palinSums = nub $ filter (\x -> isPalin $ show x) $ allSums0 2
    where isPalin s = s == reverse s

main = putStrLn $ show $ sum $ palinSums
