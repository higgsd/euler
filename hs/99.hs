-- 709
import Data.List(sortBy)
import Data.Function(on)
import Euler(splitOn)

parseBaseExp ws = [(a,b,n+1) | n <- [0..length ws-1],
                               let [a,b] = parseOne $ ws !! n]
    where parseOne w = map read $ splitOn ',' w


findLargest ws = snd $ last $ sortBy (compare `on` fst) $
                 map logBaseExp $ parseBaseExp ws
    where logBaseExp (a,b,n) = (b * log a, n)

main = do
    ns <- readFile "../p099_base_exp.txt"
    putStrLn $ show $ findLargest $ lines ns
