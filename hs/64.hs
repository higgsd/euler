-- 1322
import Math.NumberTheory.Powers.Squares(isSquare)
import Euler(intSqrt)

nn = 10000

sqrtSeq n (a,b,d) = (a2,b2,d2):sqrtSeq n (a,b2,d2)
    where d2 = (n - b ^ 2) `div` d
          b2 = a - ((a + b) `mod` d2)
          a2 = (a + b2) `div` d2

sqrtLen x = (length $ takeWhile (/= y) ys) + 1
    where a0 = intSqrt x
          (y:ys) = sqrtSeq x (a0,a0,1)

countOdds n = length $ filter odd $ map sqrtLen $ filter (not.isSquare) [1..n]

main = putStrLn $ show $ countOdds nn
