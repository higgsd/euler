-- 427337
import Euler(readMatrix, walkMatrixDown, walkMatrixRight)

-- walk rows repeatedly until matrix converges
-- get resulting sum from bottom corner
bestPath0 m s
    | s == s2 = last $ last s
    | otherwise = bestPath0 m s2
    where s2 = walkMatrixDown m $ walkMatrixRight m s
bestPath m@(r@(h:_):_) = bestPath0 m s
    where s = [h:drop 1 srow] ++ replicate (length m-1) srow
          srow = replicate (length r) (-1)
bestPath _ = error "bestPath: empty"

main = do
    s <- readFile "../files/matrix.txt"
    putStrLn $ show $ bestPath $ readMatrix s
