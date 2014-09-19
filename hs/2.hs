-- 4613732
nn = 4000000

genFib a b = c : genFib b c
    where c = a+b

main = putStrLn $ show $ sum $ takeWhile (nn>) $ filter even $ genFib 1 2
