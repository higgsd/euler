-- 161667
import Data.Array(accumArray, elems)

nn = 1500000

-- pythagorian triple generator
primTri m n
    | n >= m = primTri (m+1) 1          -- invalid pair, next m
    | p > nn && n == 1 = []             -- m still too big, done
    | p > nn = primTri (m+1) 1          -- n too big, next m
    | even (m - n) = primTri m (n+1)    -- m-n must be odd, next n
    | gcd m n /= 1 = primTri m (n+1)    -- must be coprime, next n
    | otherwise = p : primTri m (n+1)   -- keep, next n
    where p = 2 * m * (m + n)

multTri [] _ = []
multTri (p:ps) k
    | p * k > nn = multTri ps 1
    | otherwise = p * k : multTri (p:ps) (k+1)

allTri = multTri (primTri 1 1) 1
accumTri = accumArray (+) 0 (1,nn) [(p,1) | p <- allTri]

main = putStrLn $ show $ length $ filter (==1) $ elems accumTri
