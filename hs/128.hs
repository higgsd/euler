-- 14516824220
import Euler(isPrimeSimple)

kk = 2000

-- A is the first hex in each ring (top)
-- diff vs. upper-left, upper-right, and lower right
-- remaining differences are always even
-- skip origin

-- B is the last hex in each ring (top-right)
-- diff vs. upper-left, lower-left, and upper-right
-- skip first layer, origin is odd

genDiffs = a:(head diffA):(concat $ zipWith (\x y -> [x, y]) (tail diffA) diffB)
    where a = (1, [2,3,5])
          diffA = [(2+3*n*(n-1), [6*n-1, 6*n+1, 12*n+5]) | n <- [1..]]
          diffB = [(1+3*n*(n+1), [6*n-1, 6*n+5, 12*n-7]) | n <- [2..]]

primeDiffs = filter (\(_,xs) -> all isPrimeSimple xs) genDiffs

main = putStrLn $ show $ fst $ primeDiffs !! (kk-1)
