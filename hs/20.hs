-- 648

digitSum n = sum $ map (\c -> read [c]) $ show n

main = putStrLn $ show $ digitSum $ product [1..100]
