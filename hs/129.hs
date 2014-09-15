-- 1000023
import Euler(repunitAN)

nn = 1000000

-- A(n) > n, only bother with GCD once
minAN = nn + (length $ takeWhile (nn>=) $ map repunitAN [nn..])

main = putStrLn $ show $ minAN
