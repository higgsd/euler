-- 149253
import Euler(repunitAN, isPrimeSimple)

nn = 25

compAN = [n | n <- [6..], gcd n 10 == 1, not $ isPrimeSimple n,
              (n-1) `mod` (repunitAN n) == 0]

main = putStrLn $ show $ sum $ take nn compAN
