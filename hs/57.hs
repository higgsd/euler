-- 153
import Euler(toDigitsBase)

kk = 1000

countLarger k = length $ filter moreDigits $ take k $ iterate genSqrt (3,2)
    where moreDigits (n,d) = countDigits n > countDigits d
          countDigits x = length $ toDigitsBase 10 x
          genSqrt (n,d) = (d*2+n, n+d)

main = putStrLn $ show $ countLarger kk
