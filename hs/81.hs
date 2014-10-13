-- 427337
import Data.List(transpose)
import Euler(readMatrix)

sumCell xx y yy
    | y == -1 = -1
    | yy == -1 = xx + y
    | otherwise = min yy (xx + y)

sumRow _ [y] = [y]
sumRow (_:xx:xs) (y:yy:ys) = y : sumRow (xx:xs) (y2:ys)
    where y2 = sumCell xx y yy
sumRow _ _ = error "sumRow"

sumRight m s = map (\(x,y) -> sumRow x y) $ zip m s
sumDown m s = transpose $ sumRight (transpose m) (transpose s)

bestPath0 m s
    | s == s2 = last $ last s
    | otherwise = bestPath0 m s2
    where s2 = sumDown m $ sumRight m s
bestPath m = bestPath0 m s
    where s = [(head $ head m):drop 1 srow] ++ (replicate (nr-1) srow)
          srow = replicate nc (-1)
          nr = length m
          nc = length $ head m

main = do
    s <- readFile "../files/matrix.txt"
    putStrLn $ show $ bestPath $ readMatrix s
