-- 661
import Data.Function(on)
import Data.List(maximumBy)
import Math.NumberTheory.Powers.Squares(isSquare)
import Euler(intSqrt)

nn = 1000

nextDio d a0 a1 p0 p1 p2 q0 q1 q2
    | p2^2 - d*q2^2 == 1 = p2
    | otherwise = nextDio d a0 a2 p2 p3 p4 q2 q3 q4
    where a2 = (a0+p3) `div` q3
          p3 = a1*q1 - p1
          q3 = (d - p3^2) `div` q1
          p4 = a2*p2 + p0
          q4 = a2*q2 + q0

solveDio d = nextDio d a0 a1 p0 p1 p2 q0 q1 q2
    where a0 = intSqrt d
          a1 = (a0+p1) `div` q1
          p0 = a0
          p1 = a0
          p2 = a0*a1 + 1
          q0 = 1
          q1 = d - a0^2
          q2 = a1

maxDio n = maximumBy (compare `on` solveDio) $ filter (not.isSquare) [2..n]

main = putStrLn $ show $ maxDio nn
