-- 210
import Euler(toDigitsBase)

nn = 6

calcProd n = product $ map (champDigits !!) $ take n $ iterate (10*) 1
    where champDigits = concatMap (toDigitsBase 10) [0..]

main = putStrLn $ show $ calcProd nn
