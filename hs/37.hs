-- 748317
import Data.List(inits, tails)
import Euler(isPrimeSimple)

nn = 11
pfirst = ["2","3","5","7"]
pmiddle = ["1","3","7","9"]
plast = ["3","7"]

isTrunc s = all (isPrimeSimple . read) (firsts ++ lasts)
    where firsts = tail $ inits s
          lasts = tail . reverse . tail $ tails s

genMiddles 0 xs = xs
genMiddles n [] = genMiddles (n-1) pmiddle
genMiddles n xs = genMiddles (n-1) [c ++ x | c <- pmiddle, x <- xs]

genDigits 0 = [a ++ c | a <- pfirst, c <- plast] 
genDigits n = [a ++ b ++ c | a <- pfirst, b <- genMiddles n [], c <- plast] 

allTruncs = [ read s | n <- [0..], s <- genDigits n, isTrunc s ]

main = putStrLn $ show $ sum $ take nn $ allTruncs
