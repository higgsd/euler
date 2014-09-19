-- 4782
import Euler(fibonacci)

nn = 1000

-- cannot use logBase 10, exceeds floating point range
findFibDigits n = snd $ head $ filter (\x -> n == fst x) $ zip fibDigits [1..]
    where fibDigits = map (length.show) fibonacci

main = putStrLn $ show $ findFibDigits nn
