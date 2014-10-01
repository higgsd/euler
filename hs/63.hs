-- 49
import Euler(toDigitsBase)

-- 10^p always has length p+1
countPowers0 p
    | n == 0 = 0
    | otherwise = n + countPowers0 (p+1)
    where powLen x = length $ toDigitsBase 10 (x^p)
          n = length $ takeWhile (\x -> p == powLen x) [9,8..1]
countPowers = countPowers0 1

main = putStrLn $ show $ countPowers
