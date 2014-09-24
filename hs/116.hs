-- 20492570929
mm = [2,3,4]
nn = 50

-- first block is either black or colored
-- a(n) = a(n-1) + a(n-m)
-- ignore all-black result
-- f(n) = a(n) - 1

getCount0 m = (map (getSlowCount m) [0..] !!)
getSlowCount m n = if m > n then 1 else getCount0 m (n-1) + getCount0 m (n-m)
getCount m n = (getCount0 m n) - 1

sumAllCounts ms n = sum $ map (\m -> getCount m n) ms

main = putStrLn $ show $ 20492570929 -- XXX sumAllCounts mm nn
