-- 16695334890
import Euler(digitUsagePad)

show3 n = replicate (3-length s) '0' ++ s
    where s = show n

genAll = [ show h ++ show3 (g * 2) ++ show3 (d * 7) ++ show3 (a * 17) |
           a <- [1..999 `div` 17],
           let aa = digitUsagePad 3 (a*17),
           all (2>) aa,
           b <- [1..999 `div` 13],
           a * 17 `div` 10 == b * 13 `mod` 100,
           c <- [1..999 `div` 11],
           b * 13 `div` 10 == c * 11 `mod` 100,
           d <- [1..999 `div` 7],
           c * 11 `div` 10 == d * 7 `mod` 100,
           let dd = digitUsagePad 3 (d*7),
           all (2>) dd,
           zipWith min aa dd == replicate 10 0,
           e <- [1..999 `div` 5],
           d * 7 `div` 10 == e * 5 `mod` 100,
           f <- [1..999 `div` 3],
           e * 5 `div` 10 == f * 3 `mod` 100,
           g <- [1..999 `div` 2],
           f * 3 `div` 10 == g * 2 `mod` 100,
           let gg = digitUsagePad 3 (g*2),
           all (2>) gg,
           zipWith min aa gg == replicate 10 0,
           zipWith min dd gg == replicate 10 0,
           let nn = zipWith3 (\x y z -> x + y + z) aa dd gg,
           let h = length $ takeWhile (>0) nn]

sumAll = sum $ map read genAll

main = putStrLn $ show $ sumAll
