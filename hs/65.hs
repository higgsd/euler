-- 272
import Euler(digitSum, expConvergents)

nn = 100

convSum n = digitSum $ fst $ expConvergents (2,genPeriod 1) !! (n-1)
    where genPeriod x = [1,2*x,1] ++ genPeriod (x+1)

main = putStrLn $ show $ convSum nn
