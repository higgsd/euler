-- 7295372
import Data.Ratio((%),denominator)

nn = 12000
an = 1
ad = 3
bn = 1
bd = 2
aa = an % ad
bb = bn % bd

frange n = [n1..n2]
    where n1 = ((n * an) `div` ad) + 1
          n2 = (n * bn) `div` bd

genFracs x = [f | d <- [1..x], n <- frange d, let f = n % d,
              denominator f == d, aa < f && f < bb]

main = putStrLn $ show $ length $ genFracs nn
