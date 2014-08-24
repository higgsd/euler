-- 26033
import Data.Function(on)
import Data.List(groupBy, subsequences, intersect)
import Data.Map(fromList, toList, findWithDefault)
import Euler(isPrimeSimple, primeSieve)

nn = 5
mm = 10000

primes = primeSieve mm

pairs = [ (a,b) | a <- primes, b <- primes, b > a, isPrimePair a b ]
    where isPrimeAB a b = isPrimeSimple $ read $ show a ++ show b
          isPrimePair a b = isPrimeAB a b && isPrimeAB b a

genMap = fromList [([fst $ head p], map snd p) |
                     p <- groupBy ((==) `on` fst) pairs, length p >= nn - 1]

genSubs xs = filter (\x -> length x == length xs - 1) $ subsequences xs

genVal nk m = foldr intersect f $ map find ks
    where find k = findWithDefault [] k m
          f = find $ head $ genSubs nk
          ks = tail $ genSubs nk

mergeMap m = fromList [(nextKey k i, nextVal k i m) |
                       (k,v) <- toList m, i <- v,
                       (length $ nextVal k i m) > 0]
    where nextKey k i = k ++ [i]
          nextVal k i mx = genVal (nextKey k i) mx

genXPrimes 2 = genMap
genXPrimes n = mergeMap $ genXPrimes (n-1)

genPrimes n = [ a ++ [p] | (a,b) <- toList $ genXPrimes n, p <- b ]

minSum = minimum $ map sum $ genPrimes nn

main = putStrLn $ show $ minSum
