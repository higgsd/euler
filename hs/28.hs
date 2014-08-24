-- 669171001

sumDiags 1 = 1
sumDiags n = 4 * n * n - 6 * n + 6

main = putStrLn $ show $ sum $ map sumDiags [1,3..1002]
