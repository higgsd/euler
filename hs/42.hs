-- 162
import Euler

genTri n t
    | x == n = True
    | x > n = False
    | otherwise = genTri n (t+1)
    where x = t * (t+1) `div` 2
isTri n = genTri n 1

main = do
    ws <- loadWordFile "../words.txt"
    putStrLn $ show $ length $ filter isTri $ map wordScore ws
