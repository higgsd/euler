-- 1587000
import Data.Ratio((%))

nn = 99 % 100

digitCmp0 _ _ 0 = True
digitCmp0 f p n = if f m p then False else digitCmp0 f m d
    where m = n `mod` 10
          d = n `div` 10
digitCmp f n = digitCmp0 f (n `mod` 10) (n `div` 10)

genBouncyRatio0 n s
    | isBouncy n = (s+1) % n : genBouncyRatio0 (n+1) (s+1)
    | otherwise = s % n : genBouncyRatio0 (n+1) s
    where isBouncy x = not (digitCmp (>) x || digitCmp (<) x)
genBouncyRatio = genBouncyRatio0 1 0

findBouncyRatio n = 1 + (length $ takeWhile (/= n) genBouncyRatio)

main = putStrLn $ show $ findBouncyRatio nn
