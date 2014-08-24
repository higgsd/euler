-- 932718654
import Euler(digitUsage)

nn = 9
mm = 10 ^ (nn `div` 2)

isPandigital s = digitUsage 123456789 == digitUsage n
    where n :: Int
          n = read s

makePan n d s
    | length s >= nn = s
    | otherwise = makePan n (d+1) s2
    where s2 = s ++ (show $ n * d)
genPan n = makePan n 1 ""

allPans :: [Int]
allPans = map read [ s | s <- map genPan [1..mm], isPandigital s ] 

main = putStrLn $ show $ maximum allPans
