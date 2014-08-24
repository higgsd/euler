-- 4782

pairFib n (a,b)
    | n == 1 = a
    | n == 2 = b
    | otherwise = pairFib (n-1) (b, a+b)
fibNum n = pairFib n (1,1)

getFib n = head [ x | x <- [1..], numLen x >= n ]
    where numLen x = length $ show $ fibNum x

main = putStrLn $ show $ getFib 1000
