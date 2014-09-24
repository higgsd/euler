-- 162
import Data.List.Ordered(has)
import Euler(readWords, triangular, wordScore)

countTri s = length $ filter (has triangular) $ map wordScore $ readWords s

main = do
    s <- readFile "../files/words.txt"
    putStrLn $ show $ countTri s
