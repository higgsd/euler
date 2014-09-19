-- 233168
nn = 1000

main = putStrLn $ show $ sum $ filter isMult35 [1..nn-1]
    where isMult35 x = x `mod` 3 == 0 || x `mod` 5 == 0
