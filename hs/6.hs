-- 25164150
nn = 100

diffSums n = (sum [1..n])^2 - sum (map (^2) [1..n])

main = putStrLn $ show $ diffSums nn
