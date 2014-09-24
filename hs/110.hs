-- 9350130049860600
import Data.List(group)
import Euler(primeFactorsP, primeSieve)

nn = 4000000
kk = head [n | n <- [1..], 3^n > nn]
primes = take kk $ primeSieve (nn^2)

genSigmas [] = []
genSigmas (n:ns)
    | any (> maximum primes) fs = genSigmas ns
    | otherwise = (x,n) : genSigmas ns
    where fs = primeFactorsP primes n
          as = map length $ group fs
          x = product $ map (\a -> 2*a+1) as

findSolution = snd $ head $ dropWhile isSolution $ genSigmas candidates
    where isSolution x = fst x <= nn * 2
          candidates = map (\x -> x * (product $ take (kk-2) primes)) [1..]

main = putStrLn $ show $ findSolution
