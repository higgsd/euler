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

genSols = [n | v <- [1..nn], u <- [1..min (3*v-1) (nn `div` v)],
               let (z,m1) = (3*v-u) `divMod` 4, m1 == 0,
               let (d,m2) = (v+u) `divMod` 4, m2 == 0,
               let n = 3*d^2 + 2*d*z - z^2]

countSols = accumArray (+) 0 (1,nn) $ map (\x -> (x,1)) genSols

main = putStrLn $ show $ length $ filter (\x -> snd x == kk) $ assocs countSols
