-- 1366
import Data.Char(ord)

nn = 1000

powerDigitSum n = sum $ map (\c -> ord c - ord '0') $ show $ 2^n

main = putStrLn $ show $ powerDigitSum nn
