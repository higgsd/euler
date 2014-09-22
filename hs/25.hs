-- 4782
import Euler(fibonacci, toDigitsBase)

nn = 1000

-- cannot use logBase 10, exceeds floating point range
findFibDigits n = snd $ head $ filter (\x -> n == fst x) $ zip fibDigits [1..]
    where fibDigits = map (\x -> length $ toDigitsBase 10 x) fibonacci

main = putStrLn $ show $ findFibDigits nn
