-- 296962999629
import Euler(digitUsage, primeSieve)

xx = 1487
ss = 3330
dd = 4
nn = 10 ^ dd

primeTriple = [ (a,b,c) | let primes = primeSieve nn, a <- primes, a /= xx,
                          let b = a + ss, let c = b + ss,
                          b `elem` primes, c `elem` primes,
                          let aa = digitUsage a,
                          aa == digitUsage b, aa == digitUsage c ]

main = putStrLn $ show a ++ show b ++ show c
    where (a,b,c) = head primeTriple
