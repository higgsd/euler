-- 55374
import Data.Array(array,(!))

nn = 1000000

memoPart = array (0,nn) [(n, genParts n) | n <- [0..nn]]

genParts 0 = 1
genParts n = sum [s * memoPart ! p | (s,p) <- zip signs $ parts n]
    where signs = cycle [1,1,-1,-1]
          subn = map genPent $ concat [[x,-x] | x <- [1..]]
          genPent x = x * (3 * x - 1) `div` 2
          parts x = takeWhile (>= 0) [x-v | v <- subn]

findPart = head $ filter (\x -> (memoPart ! x) `mod` nn == 0) [1..]

main = putStrLn $ show $ findPart
