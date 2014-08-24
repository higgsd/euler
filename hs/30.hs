-- 443839

nn = 5
vv = (9 ^ nn) * (nn + 1)

digitPowerSum n = sum [ read [c] ^ nn | c <- show n ]

main = putStrLn $ show $ sum [ n | n <- [10..vv], n == digitPowerSum n ]
