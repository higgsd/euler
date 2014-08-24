-- 272
nn = 100

f = drop 3 $ reverse $ concat $ [[1,n*2,1] | n <- [1..nn `div` 3 + 1]]

calcFrac nd [] = nd
calcFrac (n,d) (x:xs) = calcFrac (d, x*d + n) xs

getFrac (d:xs) = calcFrac (1,d) xs
getFrac _ = error "unreachable"

calcNum = n + 2 * d
    where (n,d) = getFrac f

main = putStrLn $ show $ sum $ map (\c -> read [c]) $ show $ calcNum
