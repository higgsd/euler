-- 983
import Data.List(sort)

countRepeating n r depth xs
    | rem2 `elem` xs = depth
    | otherwise = countRepeating n rem2 (depth + 1) (rem2:xs)
    where rem2 = r * 10 `mod` n

digitsRepeating = map (\n -> countRepeating n 1 1 [0, 1])

mostDigitsRepeating xs = snd $ head $ reverse $ sort $ zip (digitsRepeating xs) xs

main = putStrLn $ show $ mostDigitsRepeating [2..1000]
