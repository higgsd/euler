-- 837799
import qualified Data.Map as Map

nextItem n
    | even n = n `div` 2
    | otherwise = n * 3 + 1

updateChain lut _ [] = lut
updateChain lut depth (c:cs) = updateChain nlut (depth+1) cs
    where nlut = Map.insert c depth lut

findChain lut [] = lut
findChain lut xs = case Map.lookup n lut of
    Nothing -> findChain lut (n:xs)
    Just depth -> updateChain lut (depth+1) xs
    where n = nextItem $ head xs

buildChains lut [] = lut
buildChains lut (x:xs) = buildChains (findChain lut [x]) xs

longestChain = snd $ Map.findMax lut2
    where lut1 = buildChains (Map.fromList [(1,1)]) [2..1000000]
          lut2 = Map.fromList $ zip (Map.elems lut1) (Map.keys lut1)

main = putStrLn $ show $ longestChain
