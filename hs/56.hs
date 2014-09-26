-- 972
import Euler(digitSum)

nn = 99

maxDigitSum n = maximum $ map digitSum [a^b | a <- [1..n], b <- [1..n]]

main = putStrLn $ show $ maxDigitSum nn
