-- 376
import Control.Applicative((<*))
import qualified Data.Attoparsec.ByteString.Char8 as AP
import Data.ByteString.Char8(pack)
import Data.Char(ord)
import Data.List(group, sort)

readPoker s = case AP.parseOnly (pokerParser <* AP.endOfInput) (pack s) of
                Left e -> error $ "readPoker: " ++ e
                Right xs -> map (splitAt 5) $ filter (not.null) xs
    where pokerParser = handParser `AP.sepBy` AP.endOfLine
          handParser = cardParser `AP.sepBy` (AP.char ' ')
          cardParser = do
            r <- rankParser
            h <- suitParser
            return (r,h)
          rankParser = do
            r <- AP.satisfy $ AP.inClass "23456789TJQKA"
            return $ cardValue r
          cardValue r = case r of
            'A' -> 14
            'K' -> 13
            'Q' -> 12
            'J' -> 11
            'T' -> 10
            v -> ord v - ord '0'
          suitParser = do
            h <- AP.satisfy $ AP.inClass "CDHS"
            return h

evalHand xs = (if hasFlush && hasStraight then rs else [],  -- straight flush
               if ns == [4,1] then ks else [],              -- four of a kind
               if ns == [3,2] then ks else [],              -- full house
               if hasFlush then rs else [],                 -- flush house
               if hasStraight then rs else [],              -- straight
               if ns == [3,1,1] then ks else [],            -- three of a kind
               if ns == [2,2,1] then ks else [],            -- two pair
               if ns == [2,1,1,1] then ks else [],          -- one pair
               rs)                                          -- highest card
    where (rs,ss) = unzip $ reverse $ sort xs
          r1 = head rs
          s1 = head ss
          (ns,ks) = unzip $ reverse $ sort $
                    map (\x -> (length x, head x)) $ group rs
          hasFlush = all (s1 ==) ss
          hasStraight = [r1,r1-1..r1-4] == rs

countWins xs = length $ filter (\(a,b) -> evalHand a > evalHand b) xs

main = do
    s <- readFile "../files/poker.txt"
    -- putStrLn $ show $ countWins $ readPoker s
    putStrLn $ show $ countWins $ readPoker s
