-- 748317
import Data.List(inits, tails)
import Euler(isPrimeSimple)

nn = 11
aa = [2,3,5,7] -- first digit must be prime, so final right-trunc is prime
bb = [1,3,7,9] -- middle digit must be odd, so intermediate truncs are prime
cc = [3,7] -- last digit must be an odd prime, so final left-trunc is prime

buildNum [] = 0
buildNum (x:xs) = x + 10*buildNum xs

isTrunc xs = all (isPrimeSimple.buildNum) $ left ++ right
    where left = tail $ inits xs
          right = tail $ init $ tails xs

sumTruncs n = sum $ take n $ map buildNum $
              filter isTrunc $ concatMap genDigits [0..]
    where genDigits 0 = [[c,a] | a <- aa, c <- cc]
          genDigits d = [[c]++b++[a] | a <- aa, c <- cc, b <- genMiddles d []]
          genMiddles 0 xs = xs
          genMiddles d [] = genMiddles (d-1) [[b] | b <- bb]
          genMiddles d xss = genMiddles (d-1) [b:xs | b <- bb, xs <- xss]

main = putStrLn $ show $ sumTruncs nn
