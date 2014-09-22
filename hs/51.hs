-- 121313
import Data.Array((//), elems, listArray)
import Data.Function(on)
import Data.List(groupBy, sortBy, subsequences)
import Euler(primeSieve)

nn = 8
dd = 6
mm = 10 ^ dd

dprimes d = takeWhile (10^d >) $ dropWhile (10^(d-1) >) $ primeSieve mm

hasSameDigits [] _ = error "unreachable"
hasSameDigits (d:ds) s = all (\h -> s !! d == s !! h) ds

dropDigits ds s = elems $ a // (zip ds $ repeat 'Z')
    where a = listArray (0, length s - 1) s

groupPrimes ds d = groupBy ((==) `on` fst) $ sortBy (compare `on` fst) ps
    where ps = [ (dropDigits ds s, p) | p <- dprimes d,
                    let s = show p, hasSameDigits ds s ]

filteredPrimes d = [ snd $ head p | ds <- subsequences [0..d-1], length ds > 0,
                     p <- groupPrimes ds d, length p >= nn ]

bestPrime = head [ minimum ps | ps <- map filteredPrimes [2..], length ps > 0 ]

main = putStrLn $ show $ bestPrime
