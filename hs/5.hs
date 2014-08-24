-- 232792560

isDivisible n = all tryDiv [2..20]
    where tryDiv x = n `mod` x == 0

tryReduce n d
    | n `mod` d == 0 && isDivisible (n `div` d) = tryReduce (n `div` d) d
    | otherwise = n

reduceAll _ [] = error "unreachable"
reduceAll n (x:[]) = tryReduce n x
reduceAll n (x:xs) = reduceAll (tryReduce n x) xs

main = putStrLn $ show $ reduceAll (product [2..20]) [2..20]
