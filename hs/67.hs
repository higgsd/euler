-- 7273
import Euler(readMatrix)

-- accumulate best path from the bottom-up
sumTri0 [[x]] = x
sumTri0 (x:y:ys) = sumTri0 (yy:ys)
    where xx = map (\(a,b) -> max a b) $ zip x (tail x)
          yy = map (\(a,b) -> a+b) $ zip xx y
sumTri0 _ = error "sumTri0: empty"
bestTriPath t = sumTri0 $ reverse t

main = do
    s <- readFile "../files/triangle.txt"
    putStrLn $ show $ bestTriPath $ readMatrix s
