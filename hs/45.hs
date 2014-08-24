-- 1533776805
import Euler(isPentagonal, isTriangular)

genHex = map calcHex [144..]
    where calcHex n = n * (2 * n - 1)

findTriple = [ n | n <- genHex, isPentagonal n, isTriangular n ]

main = putStrLn $ show $ head findTriple
