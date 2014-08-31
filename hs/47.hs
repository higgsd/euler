-- 134043
import Data.List(group, sort)
import Euler(primeSieve)

nn = 200000

nfactorSieve n = map (\x -> length x - 1) $ group $ sort ps
    where ps = concat $ [0..n] : [[x*2,x*3..n] | x <- primeSieve n]

matchn n xs
    | cs == replicate n n = head ns
    | otherwise = matchn n $ tail xs
    where (ns,cs) = unzip $ take n xs

main = putStrLn $ show $ matchn 4 $ zip [0..nn] $ nfactorSieve nn
