-- 376
import Data.List(sort, group)
import Data.Char(ord)

makeHands xs = map (splitAt 5 . words) $ lines $ filter (\c -> c /= '\r') xs

parseCard [r,s]
    | r == 'A' = (14,s)
    | r == 'K' = (13,s)
    | r == 'Q' = (12,s)
    | r == 'J' = (11,s)
    | r == 'T' = (10,s)
    | otherwise = (ord r - ord '0', s)
parseCard _ = error "unreachable"

parseHand xs = reverse $ sort $ map parseCard xs

parseHands [] = []
parseHands ((a,b):xs) = (parseHand a, parseHand b) : parseHands xs

hasFlush ((_,s):xs) = all (\c -> s == snd c) xs
hasFlush _ = error "unreachable"

hasStraight xs = [r,r-1,r-2,r-3,r-4] == map fst xs
    where r = fst $ head xs

getKinds xs = reverse $ sort $ [(length x, head x) | x <- group $ map fst xs]

hasFull ((n1,_):(n2,_):_) = n1 == 3 && n2 == 2
hasFull _ = error "unreachable"

hasFour ((n,_):_) = n == 4
hasFour _ = error "unreachable"

hasThree ((n1,_):(n2,_):_) = n1 == 3 && n2 == 1
hasThree _ = error "unreachable"

hasTwoPair ((n1,_):(n2,_):_) = n1 == 2 && n2 == 2
hasTwoPair _ = error "unreachable"

hasPair ((n1,_):(n2,_):_) = n1 == 2 && n2 == 1
hasPair _ = error "unreachable"

getRanks xs = map snd xs ++ replicate (5-length xs) 0

evalHand xs = (hasFlush xs, hasStraight xs, hasFull ks, hasFour ks,
               hasThree ks, hasTwoPair ks, hasPair ks, getRanks ks)
    where ks = getKinds xs

evalHands [] = []
evalHands ((a,b):xs) = (evalHand a, evalHand b) : evalHands xs

-- a=flush, b=str, c=full, d=4x, e=3x, f=2pair, g=2x, h=ranks
p1wins ((a1,b1,c1,d1,e1,f1,g1,h1),(a2,b2,c2,d2,e2,f2,g2,h2))
    | sf1 || sf2 = (sf1, h1) > (sf2, h2)
    | d1 || d2 = (d1, h1) > (d2, h2)
    | c1 || c2 = (c1, h1) > (c2, h2)
    | a1 || a2 = (a1, h1) > (a2, h2)
    | b1 || b2 = (b1, h1) > (b2, h2)
    | e1 || e2 = (e1, h1) > (e2, h2)
    | f1 || f2 = (f1, h1) > (f2, h2)
    | g1 || g2 = (g1, h1) > (g2, h2)
    | otherwise = h1 > h2
    where (sf1,sf2) = (a1 && b1, a2 && b2)

countWins xs = length $ filter p1wins xs

main = do
    contents <- readFile "../poker.txt"
    putStrLn $ show $ countWins $ evalHands $ parseHands $ makeHands contents
