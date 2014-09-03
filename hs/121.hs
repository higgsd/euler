-- 2269
import Data.Ratio((%), numerator, denominator)

nn = 15

games = [g | n <- [0..2^nn-1], let g = buildPlay n, sum g > nn `div` 2]
    where getPlay x = x `mod` 2
          buildPlay0 1 x = [getPlay x]
          buildPlay0 n x = (getPlay x) : buildPlay0 (n-1) (x `div` 2)
          buildPlay x = buildPlay0 nn x

probGame g = product $ zipWith (\x y -> if x /= 0 then fst y else snd y) g probs
    where probs = [(x, 1 - x) | n <- [2..nn+1], let x = 1 % n]

prizeFund = denominator p `div` numerator p
    where p = sum $ map probGame games

main = putStrLn $ show $ prizeFund
