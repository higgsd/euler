-- 249
nn = 10000
mm = 50

isPalindrome n = show n == (reverse $ show n)

nextLychrel n = n + (read $ reverse $ show n)

countLychrel i n
    | isPalindrome n = True
    | i == 0 = False
    | otherwise = countLychrel (i-1) $ nextLychrel n
isLychrel n = countLychrel mm $ nextLychrel n

main = putStrLn $ show $ length [() | n <- [0..nn], not $ isLychrel n]
