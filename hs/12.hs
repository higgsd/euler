-- 76576500
import Euler(allDivisors)

nn = 500

findTri n t i = if length (allDivisors t) > n then t else findTri n (t+i) (i+1)

main = putStrLn $ show $ findTri nn 0 1
