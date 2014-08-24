-- 28684
nn = 6
pp = 4
bb = 10 ^ pp
aa = 10 ^ (pp-1)

polyn = [genf p | p <- take nn $ [poly3, poly4, poly5, poly6, poly7, poly8]]
    where genf f = filter (\x -> x `mod` 100 >= 10) $ 
                   takeWhile (bb >) $ dropWhile (aa >=) $ map f [1..]
          poly3 n = n * (n+1) `div` 2
          poly4 n = n * n
          poly5 n = n * (3 * n - 1) `div` 2
          poly6 n = n * (2 * n - 1)
          poly7 n = n * (5 * n - 3) `div` 2
          poly8 n = n * (3 * n - 2)

isCyclic a b = a `mod` 100 == b `div` 100

nextItems vs ns = [(v:vs, n:ns) | n <- [1..nn-1], not $ n `elem` ns,
                                  v <- polyn !! n, not $ v `elem` vs,
                                  isCyclic (head vs) v]

nextCycle [] = []
nextCycle ((vs,ns):xs) = nextItems vs ns ++ nextCycle xs

findCycle 1 = [([v], [0]) | v <- polyn !! 0]
findCycle n = nextCycle $ findCycle (n-1)

validCycles = [vs | (vs,_) <- findCycle nn, isCyclic (head vs) (last vs)]

main = putStrLn $ show $ sum $ head $ validCycles
