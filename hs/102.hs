-- 228
import Data.List(sort)
import Euler(splitOn)

parseTris [] = []
parseTris (x:xs) = t : parseTris xs
    where xy = map read $ splitOn ',' x
          t = sort $ zipWith toTheta (map (xy!!) [0,2,4]) (map (xy!!) [1,3,5])
          toTheta a b = atan2 b a

containsOrigin xs
    | length xs /= 3 = error "containsOrigin: length"
    | otherwise = all (\x -> -pi < x && x < pi) [b-a, c-b, a-c+2*pi]
    where [a,b,c] = take 3 xs

numWithOrigin ws = length $ filter id os
    where ts = parseTris ws
          os = map containsOrigin ts

main = do
    contents <- readFile "../files/p102_triangles.txt"
    putStrLn $ show $ numWithOrigin $ lines contents
