-- 4075
nn = 1000000
mm = 100

fact 0 = 1
fact n = product [1..n]
comb n r = fact n `div` fact r `div` fact (n-r)

main = putStrLn $ show $ length [() | r <- [1..mm], n <- [r..mm], comb n r > nn]
