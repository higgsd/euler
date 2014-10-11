-- 55374
import Data.Array((!))
import Euler(countPartsA)

nn = 1000000

findPart n = head $ filter (\x -> countPartsA n ! x `mod` n == 0) [0..]

main = putStrLn $ show $ findPart nn
