-- 303963552391
import Math.NumberTheory.Primes.Factorisation(totientSieve, sieveTotient)

nn = 1000000

-- proper fractions w/ denominator x = totient x
countFracs n = sum $ map (sieveTotient s) [2..n]
    where s = totientSieve n

main = putStrLn $ show $ countFracs nn
