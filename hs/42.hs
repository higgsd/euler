-- 162
import Data.List.Ordered(has)
import Euler(readWords, triangular, wordScore)

countTri ws = length $ filter (has triangular) $ map wordScore ws

main = do
    s <- readFile "../files/words.txt"
    putStrLn $ show $ countTri $ readWords s
