-- 1322
import Euler(sqrtExpansion)

nn = 10000

countOdds n = length $ filter (odd.length.snd.sqrtExpansion) [1..n]

main = putStrLn $ show $ countOdds nn
