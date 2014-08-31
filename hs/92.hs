-- 8581146
import Data.List(sort)
import qualified Data.Map.Strict as Map

nn = 10000000
base = Map.fromList [(sortDigits 1,0), (sortDigits 89,1)]

splitDigits n
    | n < 10 = [n]
    | otherwise = n `mod` 10 : splitDigits (n `div` 10)
sortDigits n = sort $ splitDigits n

nextItem 0 = 0
nextItem n = x * x + nextItem (n `div` 10)
    where x = n `mod` 10

searchChains ks n
    | r2 /= -1 = (r2, ks)
    | otherwise = (r, Map.insert ns r ks2)
    where ns = sortDigits n
          (r,ks2) = searchChains ks $ nextItem n
          r2 = case Map.lookup ns ks of
               Nothing -> -1
               Just x -> x

buildChains0 mx n s ks
    | mx == n = s
    | otherwise = buildChains0 mx (n+1) (s+s2) ks2
    where (s2,ks2) = searchChains ks n
buildChains mx = buildChains0 mx 1 0 base

main = putStrLn $ show $ buildChains nn
