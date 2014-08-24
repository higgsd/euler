-- 8739992577
nn = 10 ^ 10

a = 28433
b = 7830457

pp = a * (2^b) + 1

main = putStrLn $ show $ pp `mod` nn
