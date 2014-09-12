-- 18522
import Data.List(sort, group)

-- 10k too small, 100k intractible
nn = 20000
kk = 1000

calcLayer a b c d = 2*(u+f+h)
    where a2 = a+2*(d-1)
          b2 = b+2*(d-1)
          t = (d-1)*d `div` 2
          u = a2*b2-4*t
          f = a2*c
          h = b*c

genLayer a b c d
    | b > a = genLayer (a+1) 1 1 1
    | c > b = genLayer a (b+1) 1 1
    | v > nn && d == 1 && c == 1 && b == 1 = []
    | v > nn && d == 1 && c == 1 = genLayer (a+1) 1 1 1
    | v > nn && d == 1 = genLayer a (b+1) 1 1
    | v > nn = genLayer a b (c+1) 1
    | otherwise = v : genLayer a b c (d+1)
    where v = calcLayer a b c d

countLayers = map (\x -> (head x, length x)) $ group $ sort $ genLayer 1 1 1 1
findLayer = fst $ head $ filter (\x -> snd x == kk) countLayers

main = putStrLn $ show $ findLayer
