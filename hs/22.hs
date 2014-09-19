-- 871198282
import Data.List(sort)
import Euler(readWords, wordScore)

sumScores ws = sum $ map (\(n,w) -> n * wordScore w) $ zip [1..] (sort ws)

main = do
    s <- readFile "../files/names.txt"
    putStrLn $ show $ sumScores $ readWords s
