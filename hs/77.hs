-- 71
import Data.List(group, sort)
import Euler(primeSieve)

mm = 5000
bb = 100 -- guess

primeSums b s (p:ps)
    | p > r = [s]
    | length ps == 0 = nextSums
    | otherwise = concat [primeSums b s2 ps | s2 <- nextSums]
    where nextSums = [s+p*n | n <- [0..r `div` p]]
          r = b - s
primeSums _ _ [] = error "unreachable"

sumCounts b = map (\xs -> (length xs, head xs)) $
        group $ sort $ primeSums b 0 $ primeSieve b

findMinPartition b m = snd $ head $ filter (\(n,_) -> n > m) $ sumCounts b

main = putStrLn $ show $ findMinPartition bb mm
