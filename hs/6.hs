-- 25164150
nn = 100

main = putStrLn $ show $ diffSums [1..nn]
    where diffSums xs = (sum xs)^2 - sum (map (^2) xs)
