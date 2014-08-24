-- 402
import Data.Char(ord)

nn = 1000000
mm = 60

nextFact n = sum $ map fact $ digits n
    where fact 0 = 1
          fact x = product [1..x]
          digits x = map (\c -> ord c - ord '0') $ show x

factLen n
    | any (n==) [1,2,145,40585] = 1
    | any (n==) [871,45361,872,45362] = 2
    | any (n==) [169,363601,1454] = 3
    | otherwise = 1 + (factLen $ nextFact n)

main = putStrLn $ show $ length $ filter (\x -> factLen x == mm) [1..nn]
