-- 7273

readTri s = reverse $ map (\x -> map read $ words x) $ lines s

sumTri [[x]] = x
sumTri (x:y:ys) = sumTri (yy:ys)
    where xx = map (\(a,b) -> max a b) $ zip x $ tail x
          yy = map (\(a,b) -> a + b) $ zip xx y
sumTri _ = error "unreachable"

main = do
    tri <- readFile "../files/triangle.txt"
    putStrLn $ show $ sumTri $ readTri tri
