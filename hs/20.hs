-- 648
import Euler(digitSum)

nn = 100

factDigitSum n = digitSum $ product [2..n]

main = putStrLn $ show $ factDigitSum nn
