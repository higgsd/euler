-- 272
import Data.Ratio((%), numerator)
import Euler(digitSum)

nn = 100

convSum n = digitSum $ numerator $ 2 + (genFrac $ take (n-1) $ genPeriod 1)
    where genPeriod x = [1,2*x,1] ++ genPeriod (x+1)
          genFrac [] = 0%1
          genFrac (x:xs) = 1 / (x + genFrac xs)

main = putStrLn $ show $ convSum nn
