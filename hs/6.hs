-- 25164150

sumSquare xs = sum [ x * x | x <- xs ]

squareSum xs = x * x
    where x = sum xs

main = putStrLn $ show $ squareSum [1..100] - sumSquare [1..100]
