-- 871198282
import Euler
import Data.List(sort)

nameScore n name = n * wordScore name
allNameScores names = sum [ nameScore n $ names !! (n-1) | n <- [1..length names] ]

main = do
    names <- loadWordFile "../names.txt"
    putStrLn $ show $ allNameScores $ sort names
