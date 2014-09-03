-- 333082500

aa = 3
bb = 1000

-- (a-1)^n + (a+1)^n rem a^2
-- even n, rem = 2
-- odd n, rem = 2an rem n^2
-- remainder sequence repeats, use as termination condition

getMaxRem a = maximum $ 2:x:xs
    where getRem n = (2*n*a) `rem` (a^2)
          x = getRem 1
          xs = takeWhile (x /=) $ map getRem [3,5..]

main = putStrLn $ show $ sum $ map getMaxRem [aa..bb]
