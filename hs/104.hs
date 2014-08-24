-- 
import Data.List(sort, group)

nn = 1234

digitUsagePad n p = strDigitUsage (s ++ replicate (p - length s) '0')
    where s = show n
digitUsage n = strDigitUsage $ show n

strDigitUsage s = countDigit "0123456789" $ group $ sort s
    where countDigit [] _ = []
          countDigit (_:cs) [] = 0 : countDigit cs []
          countDigit (c:cs) (x:xs)
            | c == head x = length x : countDigit cs xs
            | otherwise = 0 : countDigit cs (x:xs)

main = putStrLn $ show $ digitUsagePad nn 5
