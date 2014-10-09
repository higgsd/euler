-- 428570
mm = 1000000
nn = 3
dd = 7

-- first denominator with maximum modulus will be nearest
getNearestNum n d m = n*dx `div` d
    where dx = head $ filter (\x -> x `mod` d == d-1) [m,m-1..]

main = putStrLn $ show $ getNearestNum nn dd mm
