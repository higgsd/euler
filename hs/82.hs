-- 260324
import Euler(readMatrix, walkMatrixDown, walkMatrixRight, walkMatrixUp)

-- walk rows repeatedly until matrix converges
-- get minimum sum from bottom row
bestPath0 m s
    | s == s2 = minimum $ map last s
    | otherwise = bestPath0 m s2
    where s2 = walkMatrixUp m $ walkMatrixDown m $ walkMatrixRight m s
bestPath m@(r:_) = bestPath0 m s
    where s = [head xs : replicate (length r-1) (-1) | xs <- m]
bestPath [] = error "bestPath: empty"

main = do
    s <- readFile "../files/matrix.txt"
    putStrLn $ show $ bestPath $ readMatrix s
