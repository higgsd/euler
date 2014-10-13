-- 40886
import Data.List(genericLength)
import Math.NumberTheory.Powers.Squares(isSquare)

nn = 100
dd = 100

-- https://en.wikipedia.org/wiki/Methods_of_computing_square_roots
-- #Decimal_.28base_10.29
sqrtDigit (_,(p,c)) = (x,(p2,c2))
    where y = x*(20*p+x)
          x = genericLength $ takeWhile validX [1..9]
          validX i = i*(20*p+i) <= c
          p2 = 10*p+x
          c2 = 100*(c-y)

sumAllSqrts d n = sum $ concatMap genDigits $ filter (not.isSquare) [1..n]
    where genDigits x = take d $ map fst $ drop 1 $ iterate sqrtDigit (0,(0,x))

main = putStrLn $ show $ sumAllSqrts dd nn
