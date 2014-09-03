-- 972
import Euler(digitSum)

nn = 99

main = putStrLn $ show $ maximum $ map digitSum [a ^ b | a <- [1..nn], b <- [1..nn]]
