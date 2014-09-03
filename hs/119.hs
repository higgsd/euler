-- 248155780267521
import Data.List(sort)
import Euler(digitSum)

kk = 20
nn = 10^kk-1
mm = digitSum nn
vv = 30

findPowerSums n = map fst $ filter (\x -> snd x == n) ns
    where ps = takeWhile (nn>) $ map (n^) [2..]
          ns = map (\x -> (x, digitSum x)) ps

allPowerSums = sort $ concatMap findPowerSums [2..mm]

main = putStrLn $ show $ allPowerSums !! (vv-1)
