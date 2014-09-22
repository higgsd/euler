-- 1533776805
import Euler(isPentagonal, solveQuadratic)

genHex = map calcHex [144..]
    where calcHex n = n * (2 * n - 1)

isTriangular n = r == (fromIntegral $ floor r)
    where r = solveQuadratic 0.5 0.5 (fromIntegral $ -n)

findTriple = [ n | n <- genHex, isPentagonal n, isTriangular n ]

main = putStrLn $ show $ head findTriple
