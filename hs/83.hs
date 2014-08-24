-- 425185
import Euler(loadMatrixFile)
import Data.List(transpose)

sumCell xx y yy
    | y == -1 = -1
    | yy == -1 = xx + y
    | otherwise = min yy (xx + y)

sumRow _ [y] = [y]
sumRow (_:xx:xs) (y:yy:ys) = y : sumRow (xx:xs) (y2:ys)
    where y2 = sumCell xx y yy
sumRow _ _ = error "sumRow"

sumRight m s = map (\(x,y) -> sumRow x y) $ zip m s
sumLeft m s = map reverse $ sumRight (map reverse m) (map reverse s)
sumDown m s = transpose $ sumRight (transpose m) (transpose s)
sumUp m s = utrans $ sumRight (rtrans m) (rtrans s)
    where rtrans x = map reverse $ transpose x
          utrans x = transpose $ map reverse x

bestPath0 m s
    | s == s2 = last $ last s
    | otherwise = bestPath0 m s2
    where s2 = sumLeft m $ sumUp m $ sumDown m $ sumRight m s
bestPath m = bestPath0 m s
    where s = [(head $ head m):drop 1 srow] ++ (replicate (nr-1) srow)
          srow = replicate nc (-1)
          nr = length m
          nc = length $ head m

main = do
    m <- loadMatrixFile "../matrix.txt"
    putStrLn $ show $ bestPath m
