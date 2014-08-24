-- 233168
nn = 1000

main = putStrLn $ show $ sum $ filter p [0..nn-1]
    where p x = x `mod` 3 == 0 || x `mod` 5 == 0
