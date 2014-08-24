-- 2783915460
-- different than C/python

lexperms a [] = [a]
lexperms a bs = foldr (++) [] [ lexperms (a ++ [b]) (filter (/= b) bs) | b <- bs ]

main = putStrLn $ head $ drop 999999 $ lexperms "" "0123456789"
