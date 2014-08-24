-- 71
import Euler
import Data.List(sort,group)

mm = 5000
nn = 100 -- guess
primes = primeSieve nn

primeSums s (p:ps)
    | p > r = [s]
    | length ps == 0 = nextSums
    | otherwise = concat [ primeSums ss ps | ss <- nextSums ]
    where nextSums = [ s + p * n | n <- [0..r `div` p] ]
          r = nn - s
primeSums _ [] = error "unreachable"

sumCounts = map (\xs -> (length xs, head xs)) $
        group $ sort $ primeSums 0 primes

main = putStrLn $ show $ snd $ head $ dropWhile (\p -> fst p < mm) sumCounts
