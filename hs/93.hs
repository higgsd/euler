-- 1258
import Data.Function(on)
import Data.List(group, permutations, sort, sortBy)
import Data.Ratio(denominator, numerator)

invnum = -101010101
myadd a b
    | a == invnum || b == invnum = invnum
    | otherwise = a + b
mysub a b
    | a == invnum || b == invnum = invnum
    | otherwise = a - b
mymul a b
    | a == invnum || b == invnum = invnum
    | otherwise = a * b
mydiv a b
    | a == invnum || b == invnum || b == 0 = invnum
    | otherwise = a / b

genDigits = [(a,b,c,d) | a <- [1..9], b <- [a+1..9],
                         c <- [b+1..9], d <- [c+1..9]]
genOps = [(x,y,z) | x <- ops, y <- ops, z <- ops]
    where ops = [myadd, mysub, mymul, mydiv]

evalTree1 (x,y,z) (a,b,c,d) = x a (y b (z c d))
evalTree2 (x,y,z) (a,b,c,d) = x a (y (z b c) d)
evalTree3 (x,y,z) (a,b,c,d) = x (y (z a b) c) d
evalTree4 (x,y,z) (a,b,c,d) = x (y a (z b c)) d
evalTree5 (x,y,z) (a,b,c,d) = x (y a b) (z c d)

tuplePerms (a,b,c,d) = [(w,x,y,z) | [w,x,y,z] <- permutations [a,b,c,d]]

evalAllTrees xs = [v | ops <- genOps, ys <- tuplePerms xs,
                       f <- fs, let r = f ops ys, denominator r == 1,
                       let v = numerator r, v >= 1]
    where fs = [evalTree1, evalTree2, evalTree3, evalTree4, evalTree5]

runLength xs = (runLen, xs)
    where getRun = map head $ group $ sort $ evalAllTrees xs
          runLen = length $ takeWhile id $ zipWith (==) [1..] getRun

bestRunLength = numerator $ a*1000 + b*100 + c*10 + d
    where getBest = last $ sortBy (compare `on` fst) $ map runLength genDigits
          (a,b,c,d) = snd getBest

main = putStrLn $ show $ bestRunLength
