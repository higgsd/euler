-- 1366
import Euler(toDigitsBase)

nn = 1000

powerDigitSum n = sum $ toDigitsBase 10 (2^n)

main = putStrLn $ show $ powerDigitSum nn
