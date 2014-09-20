-- 45228
import Data.List(nub)
import Euler(intSqrt, digitUsage)

kk = 9

isPandigital n a b = digitUsage n == xs
    where xs = zipWith3 (\x y z -> x+y+z)
                 (digitUsage a) (digitUsage b) (digitUsage $ a*b)

genPandigital m n = [x*y | x <- [1..intSqrt m],
                           y <- [x+1..m `div` x], isPandigital n x y]

sumPandigital k = sum $ nub $ genPandigital (buildNum ys) (buildNum xs)
    where xs = [1..k]
          n = (k-1) `div` 2
          ys = drop (k-n) xs
          buildNum [] = 0
          buildNum (d:ds) = d + 10 * buildNum ds

main = putStrLn $ show $ sumPandigital kk
