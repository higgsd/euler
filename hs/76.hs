-- 190569291
nn = 100

countParts (x,y) = 1 + (sum $ map countParts nextParts)
    where nextParts = [(x-a,a) | a <- [y..x `div` 2]]
numParts n = (countParts (n,1)) - 1

main = putStrLn $ show $ numParts nn
