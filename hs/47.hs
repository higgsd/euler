-- 134043
import Euler(nfactorSieve)

nn = 200000

matchn n xs
    | cs == replicate n n = head ns
    | otherwise = matchn n $ tail xs
    where (ns,cs) = unzip $ take n xs

main = putStrLn $ show $ matchn 4 $ zip [0..nn] $ nfactorSieve nn
