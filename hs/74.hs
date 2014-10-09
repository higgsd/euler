-- 402
import Data.Array((!), bounds, listArray)
import Euler(digitFactorial, toDigitsBase)

nn = 1000000
mm = 60
xx2 = [871, 45361, 872, 45362]
xx3 = [169, 36301, 1454]

factSum x = sum $ map digitFactorial $ toDigitsBase 10 x

factLength a x2 x3 n
    | n > (snd $ bounds a) = 1 + factLength a x2 x3 (factSum n)
    | a ! n == n = 1
    | n `elem` x2 = 2
    | n `elem` x3 = 3
    | otherwise = 1 + factLength a x2 x3 (a!n)

countFactLength x2 x3 n m =
        length $ filter (\x -> factLength a x2 x3 x == m) [1..n]
    where a = listArray (1,n) $ map factSum [1..n]

main = putStrLn $ show $ countFactLength xx2 xx3 nn mm
