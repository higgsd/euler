-- 661
import Data.Function(on)
import Data.List(maximumBy)
import Euler(intSqrt)

nn = 1000

nextDio d a0 p q a pp pn qp qn
    | pn ^ 2 - d * qn ^ 2 == 1 = pn
    | otherwise = nextDio d a0 px qx ax pn p2 qn q2
    where px = a * q - p
          qx = (d - px ^ 2) `div` q
          ax = (a0 + px) `div` qx
          p2 = ax * pn + pp
          q2 = ax * qn + qp

solveDio d a0 = nextDio d a0 p q a pp pn qp qn
    where p = a0
          q = d - a0 ^ 2
          a = (a0 + p) `div` q
          pp = a0
          pn = a0 * a + 1
          qp = 1
          qn = a

allDios = [(d,solveDio d x) | d <- [2..nn], let x = intSqrt d, d /= x ^ 2]

main = putStrLn $ show $ fst $ maximumBy (compare `on` snd) allDios
