-- 55374
import Data.Array((!))
import Euler(countPartitionsA)

nn = 1000000

findPart n = head $ filter (\x -> countPartitionsA n ! x `mod` n == 0) [0..]

main = putStrLn $ show $ findPart nn
