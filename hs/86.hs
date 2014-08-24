-- 1818
nn = 1000000

isRight x y = r == (fromIntegral $ floor r)
    where xf = fromIntegral x
          yf = fromIntegral y
          r = sqrt $ xf * xf + yf * yf

enumRights z = [(z,xy) | xy <- [2..2*z], isRight xy z]
uniqueCuboids (z,xy)
    | z >= xy = xy `div` 2
    | otherwise = 1 + z - (xy+1) `div` 2

findCuboidSide0 n m s
    | s2 >= n = m
    | otherwise = findCuboidSide0 n (m+1) s2
    where s2 = s + (sum $ map uniqueCuboids $ enumRights m)
findCuboidSide n = findCuboidSide0 n 1 0

main = putStrLn $ show $ findCuboidSide nn
