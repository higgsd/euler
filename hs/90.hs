-- 1217
genDie0 [] = concat [genDie0 [d] | d <- [0..9]]
genDie0 ds
    | length ds == 6 = [ds]
    | otherwise = concat [genDie0 (d:ds) | d <- [1+head ds..9]]
genDie = genDie0 []

swap69 [] = []
swap69 (x:xs)
    | x == 9 = 6 : swap69 xs
    | otherwise = x : swap69 xs

isValidPair0 d1 d2 = all checkDice keys
    where keys = [(0,1), (0,4), (0,6), (1,6), (2,5), (3,6), (4,6), (6,4), (8,1)]
          checkDice (a,b) = (a `elem` d1 && b `elem` d2) ||
                            (a `elem` d2 && b `elem` d1)
isValidPair d1 d2 = isValidPair0 (swap69 d1) (swap69 d2)

genDiePair = [(d1,d2) | d1 <- genDie, d2 <- genDie, d1 > d2, isValidPair d1 d2]

main = putStrLn $ show $ length $ genDiePair
