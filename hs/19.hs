-- 171
mm = 1901
nn = 2001

daysInMonth y m
    | m == 4 || m == 6 || m == 9 || m == 11 = 30
    | m /= 2 = 31
    | y `mod` 400 == 0 = 29
    | y `mod` 100 == 0 = 28
    | y `mod` 4 == 0 = 29
    | otherwise = 28

firstDaysOfMonths y m d = [d] ++ firstDaysOfMonths y2 m2 d2
    where m2 = if m == 12 then 1 else m + 1
          y2 = if m2 /= 1 then y else y + 1
          d2 = (d + daysInMonth y m) `mod` 7

firstDaysInYears y1 y2 = take m2 $ drop m1 $ firstDaysOfMonths 1900 1 1
    where m1 = (y1 - 1900) * 12
          m2 = (y2 - y1) * 12

countSundays y1 y2 = length $ filter (==0) $ firstDaysInYears y1 y2

main = putStrLn $ show $ countSundays mm nn
