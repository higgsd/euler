-- 21384
import Data.List(subsequences, (\\))

kk = 12

-- represent ordered set as {x, x+a, x+a+b, ...}
-- ignore x's since sets have equal size
genSet k = map genCoef [0..k-1]
    where genCoef n = replicate n 0 ++ replicate (k-n-1) 1

-- if there are unique coefficients on both sides,
-- this set will need checking
checkSets xs ys = any (<0) $ zipWith (-) (coefSum xs) (coefSum ys)
    where coefSum zs = [sum $ map (!!n) zs | n <- [0..(length $ head zs)-1]]

genChecks k = length [() | a <- subsequences xs,
                           length a > 1, length a <= k `div` 2,
                           b <- subsequences (xs \\ a),
                           length b == length a, a > b, checkSets a b]
    where xs = genSet k

main = putStrLn $ show $ genChecks kk
