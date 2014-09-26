-- 249
import Euler(fromDigits, toDigitsBase)

nn = 10000
kk = 50

countLychrel k n = length $ filter isLychrel [1..n]
    where isLychrel x = null $ dropWhile (not.isPalin) $
                        take k $ tail $ iterate genLychrel x
          genLychrel x = x + getPalin x
          isPalin x = x == getPalin x
          getPalin x = fromDigits $ reverse $ toDigitsBase 10 x

main = putStrLn $ show $ countLychrel kk nn
