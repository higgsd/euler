-- 49

genPowers a b (f,x)
    | n > b = if f then [] else genPowers x (b+1) (True,0)
    | n == b = ():genPowers (a+1) b (False, if f then a else x)
    | otherwise = genPowers (a+1) b (f,x)
    where n = length $ show $ a ^ b

main = putStrLn $ show $ length $ genPowers 1 1 (True,0)
