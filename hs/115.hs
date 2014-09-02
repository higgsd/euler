-- 168
import Euler(nChooseK)
mm = 50
xx = 1000000

-- see 114 for formula
countBlocks m n = sum [nChooseK (n+1-k*(m-1)) (k*2) |
                       k <- [0..(n+1) `div` (m+1)]]

main = putStrLn $ show $ snd $ head $ dropWhile (\x -> xx >= fst x) $
                                      map (\x -> (countBlocks mm x, x)) [mm..]
