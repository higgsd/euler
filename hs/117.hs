-- 100808458960497
nn = 50

-- next block is black, red, green, or blue
-- a(n) = a(n-1) + a(n-2) + a(n-3) + a(n-4)

getCount n = if n < 0 then 0 else map getSlowCount [0..] !! n
getSlowCount 0 = 1
getSlowCount 1 = 1
getSlowCount n = sum $ map getCount [n-4..n-1]

main = putStrLn $ show $ getCount nn
