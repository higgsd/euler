-- 443839
import Euler(getDigitsBase)

nn = 5

findPowerSums n = sum $ filter (\x -> x == powerSum x) [10..(n+1)*9^n]
    where powerSum x = sum $ map (^n) $ getDigitsBase 10 x

main = putStrLn $ show $ findPowerSums nn
