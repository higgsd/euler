-- 107359
import Euler
import Data.Char(isAscii, isAsciiLower, isPrint, chr, ord)
import Data.Bits(xor)
import Data.List(isInfixOf)

parseText xs = map read $ splitOn ',' xs

genKeys = [[a,b,c] | a <- [0..255], isAsciiLower $ chr a,
                     b <- [0..255], isAsciiLower $ chr b,
                     c <- [0..255], isAsciiLower $ chr c]

xorText xs ks = map chr $ zipWith xor xs $ cycle ks

isPrintable xs = all (\c -> isPrint c && isAscii c) xs

decode xs = head [tx | ks <- genKeys, let tx = xorText xs ks,
                       isPrintable tx, " the " `isInfixOf` tx]

asciiScore xs = sum $ map ord xs

main = do
    contents <- readFile "../cipher1.txt"
    putStrLn $ show $ asciiScore $ decode $ parseText contents
