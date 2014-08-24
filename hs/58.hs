-- 26241
import Euler

nn = 10

nextDiag (s,p,d) = (s + 2, p + p2, d + 4)
    where s2 = s + 2
          diagValue n = (s2) ^ 2 - (s2 - 1) * n
          p2 = length $ filter isPrimeSimple $ map diagValue [1..3]

genDiag = build (3,3,5)
    where build xs = xs : (build $ nextDiag xs)

main = putStrLn $ show $ head [s | (s,p,d) <- genDiag, d >= nn * p]
