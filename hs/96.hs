-- 24702
import Data.Array(listArray, range, (!), (//))
import Data.List(delete, nub, sortBy, groupBy)
import Data.Function(on)
import Data.Char(ord)

nn = 9
bb = ((0,0),(nn-1,nn-1))

parseBoards [] = []
parseBoards xs = parseBoard b : parseBoards ys
    where (b,ys) = splitAt (nn+1) xs

parseBoard [] = error "parseBoard: invalid"
parseBoard (x:xs) = (x, listArray bb $ concatMap parseRow xs)
    where parseRow ys = map parseSquare ys
          parseSquare c = if c == '0' then [1..9] else [ord c - ord '0']

calcSqu (y,x) = x `div` 3 + 3 * (y `div` 3)
getRow y = [yx | yx <- range ((y,0),(y,nn-1))]
getCol x = [yx | yx <- range ((0,x),(nn-1,x))]
getSqu s = [yx | yx <- range bb, calcSqu yx == s]

cancelOneUnique b (y,x) s c = b // newSqu // (newRow ++ newCol)
    where newRow = [(yx, delete c (b ! yx)) | yx <- getRow y, yx /= (y,x)]
          newCol = [(yx, delete c (b ! yx)) | yx <- getCol x, yx /= (y,x)]
          newSqu = [(yx, delete c (b ! yx)) | yx <- getSqu s, yx /= (y,x)]

cancelUniqueList b [] = b
cancelUniqueList b ((yx,c):xs) = cancelUniqueList n xs
    where s = calcSqu yx
          n = cancelOneUnique b yx s c
cancelUnique b = cancelUniqueList b uniq
    where uniq = [(yx,head x) | yx <- range bb,
                                let x = b ! yx, length x == 1]

markSolitary b = b // allSolitary
    where allSolitary = nub $ concat [solitary f n |
                        n <- [0..nn-1], f <- [getSqu, getRow, getCol]]
          unsolved f n = [(yx,v) | yx <- f n, let v = b ! yx, length v > 1]
          solitary f n = map head $ filter (\x -> length x == 1) $
                         groupBy ((==) `on` snd) $ sortBy (compare `on` snd) $
                         concat [map (\c -> (yx,[c])) v |
                                 (yx,v) <- unsolved f n]

simplify0 b
    | b2 == b = b
    | otherwise = simplify0 b2
    where b2 = cancelUnique b

simplify1 b
    | b2 == b = b
    | otherwise = simplify1 b2
    where b2 = markSolitary $ simplify0 b

makeGuesses b = [simplify1 (b // [(sq,[c])]) | c <- b ! sq]
    where sq = head [yx | yx <- range bb, length (b ! yx) > 1]

solve0 b
    | isWrong b = []
    | isSolved b = [b]
    | otherwise = concatMap solve0 $ makeGuesses b
    where isSolved n = all (\x -> length x == 1) $ map (n!) $ range bb
          isWrong n = any (\x -> length x == 0) $ map (n!) $ range bb
solve b = head $ solve0 b

solveBoards [] = []
solveBoards ((_,b):bs) = b2 : solveBoards bs
    where b2 = solve $ simplify1 b

boardResults bs = sum $ map calcResults $ solveBoards bs
    where getResults b = map (\x -> head $ b!x) $ range ((0,0),(0,2))
          calcResults b = sum $ zipWith (*) [100,10,1] $ getResults b

main = do
    contents <- readFile "../p096_sudoku.txt"
    let boards = parseBoards $ lines contents
    putStrLn $ show $ boardResults boards
