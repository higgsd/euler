-- 1000023
nn = 1000000

-- instead of building each R(k), just reuse remainders
calcAN x k n
    | x2 == 0 = (k+1)
    | otherwise = calcAN x2 (k+1) n
    where x2 = (10*x+1) `mod` n

-- A(n) > n, only bother with GCD once
minAN = nn + (length $ takeWhile (nn>=) $ map genAN [nn..])
    where genAN n = if gcd n 10 == 1 then calcAN 1 1 n else 0

main = putStrLn $ show $ minAN
