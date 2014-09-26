-- 121313
import Data.Function(on)
import Data.List((\\), groupBy, sortBy, subsequences)
import Euler(allPrimes, fromDigits, toDigitsBase)

nn = 8

-- given a sequence of primes (broken into digits)
-- and digit indices to keep and wildcard
-- 1) ensure wildcarded digits are all the same
-- 2) sort into bins by kept digits
-- 3) produce minimum prime from all correctly sized buckets
wildPrimes n xs (ks,ws) = map (fromDigits.fst.head) $
                          filter (\x -> length x == n) $
                          groupBy ((==) `on` snd) $ sortBy (compare `on` snd) $
                          map (\(x,_) -> (x, exDigits ks x)) $
                          filter (\(_,(y:ys)) -> all (==y) ys) $
                          zip xs (map (exDigits ws) xs)
    where exDigits ds ns = map (ns!!) ds

-- given primes with a fixed number of digits
-- produce all combinations of digit indices to keep and discard
-- recursively check primes w/ increasing digit counts
-- return the minimum prime when a non-empty set is found
smallestPrime0 _ [] = error "smallestPrime0: empty"
smallestPrime0 n (xs:xss) = if null ys then smallestPrime0 n xss else minimum ys
    where ys = concatMap (wildPrimes n xs) genDigits
          ks = [0..(length $ head xs) - 1]
          genDigits = map (\x -> (x, ks \\ x)) $ tail $ init $ subsequences ks
smallestPrime n = smallestPrime0 n xs
    where xs = groupBy ((==) `on` length) $ map (toDigitsBase 10) allPrimes

main = putStrLn $ show $ smallestPrime nn
