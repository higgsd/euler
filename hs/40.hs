-- 210

extractDigit (n,d) = (show v) !! (fromIntegral $ n `mod` d)
    where v = 10 ^ (d - 1) + n `div` d

nextDigit n p d
    | n >= d * p = nextDigit (n - d * p) (p * 10) (d + 1)
    | otherwise = (n, d)

calcDigit n = read [extractDigit $ nextDigit (n - 1) 9 1]

main = putStrLn $ show $ product $ map (calcDigit . (10 ^)) [1..6]
