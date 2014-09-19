-- 18769
import Data.Function(on)
import Data.List(nub, subsequences, sort, sortBy, groupBy)
import Euler(readWords)

findAnagrams ws = map (map snd) $ filter (\x -> length x > 1) $
                  groupBy ((==) `on` fst) $
                  sortBy (compare `on` fst) $ map toAnagram ws
    where toAnagram w = (sort w, w)

findAnaPairs ws = map toPair $ concat [combs xs 2 | xs <- findAnagrams ws]
    where combs xs n = filter (\x -> length x == n) $ subsequences xs
          toPair [a,b] = (a,b)
          toPair [] = error "toPair: empty"
          toPair [_] = error "toPair: singleton"
          toPair (_:_:_) = error "toPair: excess"

squaresOfLength n = map show $ takeWhile (<b) $ dropWhile (<a) $ map (^2) [1..]
    where a = 10^(n-1)
          b = 10^n

isValidMap xs = length ys == length src && length src == length dst
    where ys = nub xs
          src = nub $ map fst xs
          dst = nub $ map snd xs

mapWord ws xs = map c2n ws
    where c2n c = case lookup c xs of
                      Just v -> v
                      Nothing -> error "getChar: not found"

validSquares (a,b) = [max s n | s <- sq, let xs = zip a s, isValidMap xs,
                                let n = mapWord b xs, n `elem` sq]
    where sq = squaresOfLength $ length a

bestValidSquare :: [String] -> Int
bestValidSquare ws = maximum $ map read xs
    where xs = concatMap validSquares $ findAnaPairs ws

main = do
    s <- readFile "../files/p098_words.txt"
    putStrLn $ show $ bestValidSquare $ readWords s
