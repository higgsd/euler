-- 107359
import Control.Applicative((<*))
import qualified Data.Attoparsec.ByteString.Char8 as
        AP(char, decimal, endOfInput, endOfLine, parseOnly, sepBy)
import Data.Bits(xor)
import Data.ByteString.Char8(pack)
import Data.Char(chr, isPrint, ord)
import Data.List(isInfixOf)

readCode s = case AP.parseOnly (codeParser <* AP.endOfInput) (pack s) of
                Left e -> error $ "readCode: " ++ e
                Right xs -> head $ filter (not.null) xs
    where codeParser = lineParser `AP.sepBy` AP.endOfLine
          lineParser = AP.decimal `AP.sepBy` (AP.char ',')

isDecoded xs = all isPrint s && isInfixOf " the " s
    where s = map chr xs

decodedScore xs = sum $ head $ filter isDecoded $ map decrypt keys
    where keys = [[a,b,c] | let ks = [ord 'a'..ord 'z'],
                            a <- ks, b <- ks, c <- ks]
          decrypt ks = zipWith xor xs $ cycle ks

main = do
    s <- readFile "../files/cipher1.txt"
    putStrLn $ show $ decodedScore $ readCode s
