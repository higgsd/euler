-- 743
import Data.List(find, group)

roman = [('M', 1000), ('D', 500),
         ('C', 100), ('L', 50),
         ('X', 10), ('V', 5), ('I', 1)]
r2n c = case find (\x -> c == fst x) roman of
    Nothing -> error "r2n: invalid char"
    Just x -> snd x

mergeRoman [] = error "mergeRoman: empty"
mergeRoman [x] = x
mergeRoman (x:y:ys)
    | x > y = x + r
    | otherwise = negate x + r
    where r = mergeRoman (y:ys)
fromRoman r = mergeRoman g
    where g = map sum $ group $ map r2n r

toRoman n
    | n >= 1000 = "M" ++ toRoman (n-1000)
    | n >= 900 = "CM" ++ toRoman (n-900)
    | n >= 500 = "D" ++ toRoman (n-500)
    | n >= 400 = "CD" ++ toRoman (n-400)
    | n >= 100 = "C" ++ toRoman (n-100)
    | n >= 90 = "XC" ++ toRoman (n-90)
    | n >= 50 = "L" ++ toRoman (n-50)
    | n >= 40 = "XL" ++ toRoman (n-40)
    | n >= 10 = "X" ++ toRoman (n-10)
    | n >= 9 = "IX" ++ toRoman (n-9)
    | n >= 5 = "V" ++ toRoman (n-5)
    | n >= 4 = "IV" ++ toRoman (n-4)
    | n >= 1 = "I" ++ toRoman (n-1)
    | otherwise = []

compareRoman w = length w - (length . toRoman . fromRoman) w

main = do
    contents <- readFile "../files/roman.txt"
    putStrLn $ show $ sum $ map compareRoman $ lines contents
