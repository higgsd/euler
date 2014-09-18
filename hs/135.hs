-- 4989
import Data.Array(accumArray, assocs)

nn = 10^6
kk = 10

-- hints from http://www.mathblog.dk/project-euler-135-same-differences/
-- x^2 - y^2 - z^2 = n
-- y = z + d, x = z + 2d
-- 3d^2 + 2dz - z^2 = n
-- u = 3d - z, v = d + z, uv = n
-- z = (3v - u) / 4, d = (v + u) / 4
-- z and d both positive integers, 3v > u

genSols = [u*v | v <- [1..nn], u <- [1..min (3*v-1) (nn `div` v)],
                 (3*v-u) `mod` 4 == 0, (v+u) `mod` 4 == 0]

countSols = accumArray (+) 0 (1,nn) $ map (\x -> (x,1)) genSols

main = putStrLn $ show $ length $ filter (\x -> snd x == kk) $ assocs countSols
