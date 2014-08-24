-- 137846528820

countPaths n = product [1..n*2] `div` p `div` p
    where p = product [1..n]

main = putStrLn $ show $ countPaths 20
