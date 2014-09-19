-- 76576500
import Euler(allDivisors)

nn = 500

findTri0 n t i = if length (allDivisors t) > n then t
                 else findTri0 n (t+i) (i+1)
findTri n = findTri0 n 0 1

main = putStrLn $ show $ findTri nn
