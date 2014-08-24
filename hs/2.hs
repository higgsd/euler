-- 4613732

getNext (a,b,s)
    | c `mod` 2 == 0 = (b, c, s + c)
    | otherwise = (b, c, s)
    where c = a + b

findLast' (a,b,s)
    | s > 4000000 = s
    | otherwise = findLast' $ getNext (a,b,s)

findLast (a,b) = findLast' (a, b, b)

main = putStrLn $ show $ findLast (1,2)
