-- 932718654
import Euler(getDigitsBase, digitUsage)

nn = 9

buildNum [] = 0
buildNum (x:xs) = x + 10*buildNum xs

genMult0 _ [] _ = error "genMult0: empty"
genMult0 xs (y:ys) n
    | length xs2 == n = buildNum xs2
    | length xs2 > n = 0
    | otherwise = genMult0 xs2 ys n
    where xs2 = getDigitsBase 10 y ++ xs
genMult n x = genMult0 [] [x,x+x..] n

largestPanMult n = maximum $ filter isPandigital $ map (genMult n) [1..z-1]
    where z = 10^(n `div` 2) -- need to generate at least 2 numbers
          isPandigital x = digitUsage (buildNum [1..n]) == digitUsage x

main = putStrLn $ show $ largestPanMult nn
