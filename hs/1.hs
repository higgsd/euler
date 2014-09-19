-- 233168
nn = 1000

sumMults n = sum $ filter isMult35 [1..n-1]
    where isMult35 x = x `mod` 3 == 0 || x `mod` 5 == 0

main = putStrLn $ show $ sumMults nn
