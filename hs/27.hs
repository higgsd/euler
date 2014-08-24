-- -59231
import Euler
import Data.List(sort)

nn = 1000
mm = 80
vv = mm * mm + mm * nn + nn
primeList = [ n `elem` primes | n <- [0..vv] ]
    where primes = primeSieve vv

primeSeqLength a b = length $ takeWhile id candidates
    where candidates = [ c >= 2 && primeList !! c | n <- [0..], let c = n*n + a*n + b ]

allLengths = [ (primeSeqLength a b, a*b) | a <- [1-nn,2-nn..nn-1], b <- [2..nn-1] ]

main = putStrLn $ show $ snd $ head $ reverse $ sort $ allLengths
