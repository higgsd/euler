-- 40886
findSqrtDigit p c x
    | x * (20 * p + x) <= c = findSqrtDigit p c (x+1)
    | otherwise = x-1
nextSqrtDigit p c = findSqrtDigit p c 1

genSqrtDigits p c = (x : genSqrtDigits p2 (r * 100))
    where x = nextSqrtDigit p c
          y = x * (20 * p + x)
          p2 = 10 * p + x
          r = c - y

sumSqrtDigits n
    | n `elem` [x*x | x <- [1..10]] = 0
    | otherwise = sum $ take 100 $ genSqrtDigits 0 n

main = do
    putStrLn $ show $ sum $ map sumSqrtDigits [1..100]
