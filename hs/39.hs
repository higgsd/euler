-- 840
import Data.List(sort, group)

nn = 1000

integerTri a b
    | cc == fromIntegral c && a + b + c <= nn = Just $ a + b + c
    | otherwise = Nothing
    where cc = sqrt $ fromIntegral $ a * a + b * b
          c = floor cc

triPerims = [ integerTri a b | a <- [1..nn `div` 2], b <- [a..nn `div` 2] ]

filterPerims [] = []
filterPerims ([]:_) = error "unreachable"
filterPerims ((Nothing:_):xss) = filterPerims xss
filterPerims ((Just x:xs):xss) = [(1 + length xs, x)] ++ filterPerims xss

mostFreqPerim = snd $ maximum $ filterPerims $ group $ sort $ triPerims

main = putStrLn $ show $ mostFreqPerim
