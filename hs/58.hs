-- 26241
import Euler(isPrimeSimple)

nn = 10

findDiag0 n s p d = if d2 >= n*p2 then s2 else findDiag0 n s2 p2 d2
    where s2 = s+2
          d2 = d+4
          p2 = p + (length $ filter isPrimeSimple $ map diagValue [1..3])
          diagValue x = s2^2 - x*(s2-1)
findDiag n = findDiag0 n 3 3 5

main = putStrLn $ show $ findDiag nn
