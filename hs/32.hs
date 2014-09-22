-- 45228
import Data.List(nub)
import Euler(digitUsage, fromDigits, intSqrt)

kk = 9

isPandigital n a b = digitUsage n == xs
    where xs = zipWith3 (\x y z -> x+y+z)
                 (digitUsage a) (digitUsage b) (digitUsage $ a*b)

genPandigital m n = [x*y | x <- [1..intSqrt m],
                           y <- [x+1..m `div` x], isPandigital n x y]

sumPandigital k = sum $ nub $ genPandigital (fromDigits ys) (fromDigits xs)
    where xs = reverse [1..k]
          n = (k-1) `div` 2
          ys = take n xs

main = putStrLn $ show $ sumPandigital kk
