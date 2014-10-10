-- 161667
import Data.List(sort, group)

nn = 1500000

-- generate all primitive pythagorean triples w/ Euclid's formula
-- a = m^2 - n^2, b = 2mn, c = m^2 + n^2
-- m - n is odd and m and n are coprime
genTri x m n
    | n >= m = genTri x (m+1) 1         -- invalid pair, next m
    | n == 1 && p > x = []              -- perimeter too big, done
    | p > x = genTri x (m+1) 1          -- perimeter too big, next m
    | even (m-n) = genTri x m (n+1)     -- m-n must be odd, next n
    | gcd m n /= 1 = genTri x m (n+2)   -- must be coprime, next n
    | otherwise = p : genTri x m (n+2)  -- keep, next n
    where p = 2*m*(m+n)

-- generate all pythagorean triples by multiplying by constant factors
-- count how many of each there are and count unique perimeters
countTri p = length $ filter (==1) $ map length $ group $ sort $
             concatMap (\x -> takeWhile (p>=) $ map (x*) [1..]) $ genTri p 1 1

main = putStrLn $ show $ countTri nn
