-- 972
import Data.Char(ord)

nn = 99

digitSum n = sum $ map (\c -> ord c - ord '0') $ show n

main = putStrLn $ show $ maximum $ map digitSum [a ^ b | a <- [1..nn], b <- [1..nn]]
