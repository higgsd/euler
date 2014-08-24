-- 9110846700

nn = 1000
pp = 10

main = putStrLn $ show $ s `mod` p
    where s = sum [ i ^ i | i <- [1..nn] ]
          p = 10 ^ pp
