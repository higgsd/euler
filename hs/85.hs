-- 2772
import Data.List(sort)

nn = 2000000

getTri n = sum [1..n]
countRects x y = (getTri x) * (getTri y)

genRects x = [(y,countRects x y) | y <- [1..nn]]
bestRects0 x
    | y2 == 1 = [(n2 - nn,a2)]
    | otherwise = (nn - n1,a1) : (n2 - nn,a2) : bestRects0 (x + 1)
    where (y2,n2) = head $ dropWhile (\(_,n) -> n < nn) $ genRects x
          a2 = x * y2
          y1 = y2 - 1
          a1 = x * y1
          n1 = countRects x y1
bestRects = bestRects0 1

main = putStrLn $ show $ snd $ head $ sort $ bestRects
