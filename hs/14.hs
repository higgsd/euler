-- 837799
import Data.Function(on)
import Data.List(maximumBy)
import qualified Data.Map.Strict as M(assocs, fromList, insert, lookup)

nn = 1000000

insertChain m _ [] = m
insertChain m d (x:xs) = insertChain (M.insert x d m) (d+1) xs

searchChain _ [] = error "searchChain: empty"
searchChain m xall@(x:_) = case M.lookup nx m of
    Nothing -> searchChain m (nx:xall)
    Just d -> insertChain m (d+1) xall
    where nx = if even x then x `div` 2 else x*3+1

buildChains m [] = m
buildChains m (x:xs) = buildChains (searchChain m [x]) xs

longestChain n = fst $ maximumBy (compare `on` snd) $ M.assocs m
    where m = buildChains (M.fromList [(1,0)]) [2..n]

main = putStrLn $ show $ longestChain nn
