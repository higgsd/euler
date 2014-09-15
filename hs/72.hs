-- 303963552391
import Data.List(group, sort)
import Euler(primeSieve, intSqrt, primeFactors)

nn = 1000000
primes = primeSieve $ intSqrt nn

phi n = n * num `div` den
    where fs = map head $ group $ sort $ primeFactors primes n
          num = product $ map (\x -> x - 1) fs
          den = product fs

main = putStrLn $ show $ sum $ map phi [2..nn]
