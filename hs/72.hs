-- 303963552391
import Data.List(nub)
import Euler(primeSieve, intSqrt)

nn = 1000000
primes = primeSieve $ intSqrt nn

factors 1 _ = []
factors n [] = [n]
factors n (x:xs)
    | n `mod` x == 0 = x : factors (n `div` x) (x:xs)
    | otherwise = factors n xs
primeFactors n = nub $ factors n primes

phi n = n * num `div` den
    where fs = primeFactors n
          num = product $ map (\x -> x - 1) fs
          den = product fs

main = putStrLn $ show $ sum $ map phi [2..nn]
