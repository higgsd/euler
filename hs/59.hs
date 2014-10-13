-- 107359
import Data.Bits(xor)
import Data.Char(chr, isPrint, ord)
import Data.List(isInfixOf)
import Euler(readMatrix)

isDecoded xs = all isPrint s && isInfixOf " the " s
    where s = map chr xs

decodedScore xs = sum $ head $ filter isDecoded $ map decrypt keys
    where keys = [[a,b,c] | let ks = [ord 'a'..ord 'z'],
                            a <- ks, b <- ks, c <- ks]
          decrypt ks = zipWith xor xs $ cycle ks

main = do
    s <- readFile "../files/cipher1.txt"
    putStrLn $ show $ decodedScore $ head $ readMatrix s
