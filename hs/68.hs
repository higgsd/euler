-- 6531031914842725
import Data.List(permutations)

toFiveGon [a,b,c,d,e,f,g,h,i,j] =
    [[a,b,c],[d,c,e],[f,e,g],[h,g,i],[j,i,b]]
toFiveGon _ = error "unreachable"

gonIsMagic xs = any (==10) (z:zs) && all (z<) zs && all (y==) ys
    where (y:ys) = map sum xs
          (z:zs) = map head xs

gonToVal :: [[Int]] -> Integer
gonToVal xs = read $ toString xs
    where toString [] = []
          toString (y:ys) = concat (map show y) ++ toString ys

bestGon xs = maximum vs
    where ps = permutations xs
          gs = map toFiveGon ps
          ms = filter gonIsMagic gs
          vs = map gonToVal ms

main = putStrLn $ show $ bestGon [1..10]
