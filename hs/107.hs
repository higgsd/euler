-- 259679
import Data.Array(listArray, assocs, range, bounds, (!), (//))
import Data.Function(on)
import Data.List(sort, nub, sortBy)
import Euler(splitOn)

parseNetwork ws = listArray ((0,0),(n,n)) (parseEdges ws)
    where n = length ws - 1
          parseEdges [] = []
          parseEdges (x:xs) = (parseEdge $ splitOn ',' x) ++ parseEdges xs
          parseEdge [] = []
          parseEdge (y:ys) = (if y == "-" then 0 else read y) : parseEdge ys

numVertices a = snd $ snd $ bounds a
isValidLink ((x,y),d) = x < y && d > 0
getLinks a = sortBy (compare `on` snd) $ filter isValidLink $ assocs a

connectsTo a x = map getDest xs
    where n = numVertices a
          ix = range ((x,0),(x,n)) ++ range ((0,x),(n,x))
          xs = filter isValidLink $ map (\xy -> (xy, a ! xy)) ix
          getDest ((i,j),_) = if i == x then j else i
isConnected0 _ [] = error "isConnected0: empty"
isConnected0 a xs
    | xs == xs2 = False
    | xs2 == [0..numVertices a] = True
    | otherwise = isConnected0 a xs2
    where cs = concatMap (connectsTo a) xs
          xs2 = sort $ nub (xs ++ cs)
isConnected a = isConnected0 a [0]

-- independently discovered reverse-delete algorithm
-- https://en.wikipedia.org/wiki/Reverse-delete_algorithm
dropLinks0 a [] = a
dropLinks0 a (xy:xs) = dropLinks0 (if isConnected a2 then a2 else a) xs
    where a2 = a // [(xy,0)]
dropLinks a = dropLinks0 a (reverse $ map fst $ getLinks a)

netImproved a = netWeight a - (netWeight $ dropLinks a)
    where netWeight b = sum $ map snd $ getLinks b

main = do
    contents <- readFile "../files/p107_network.txt"
    let nw = parseNetwork $ lines contents
    putStrLn $ show $ netImproved nw
