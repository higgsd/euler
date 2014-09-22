-- 932718654
import Euler(toDigitsBase, fromDigits, digitUsage)

nn = 9

genMult0 _ [] _ = error "genMult0: empty"
genMult0 xs (y:ys) n
    | length xs2 == n = fromDigits xs2
    | length xs2 > n = 0
    | otherwise = genMult0 xs2 ys n
    where xs2 = xs ++ toDigitsBase 10 y
genMult n x = genMult0 [] [x,x+x..] n

largestPanMult n = maximum $ filter isPandigital $ map (genMult n) [1..z-1]
    where z = 10^(n `div` 2) -- need to generate at least 2 numbers
          isPandigital x = digitUsage (fromDigits [1..n]) == digitUsage x

main = putStrLn $ show $ largestPanMult nn
