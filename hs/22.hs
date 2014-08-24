-- 871198282
import Data.List(sort)
import Euler(loadWordFile, wordScore)

nameScore n name = n * wordScore name
allNameScores names = sum [ nameScore n $ names !! (n-1) | n <- [1..length names] ]

main = do
    names <- loadWordFile "../files/names.txt"
    putStrLn $ show $ allNameScores $ sort names
