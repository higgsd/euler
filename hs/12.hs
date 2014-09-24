-- 76576500
import Euler(allDivisors, triangular)

nn = 500

findTri n = fst $ head $ filter (\(_,x) -> x > n) $
            map (\x -> (x, length $ allDivisors x)) triangular

main = putStrLn $ show $ findTri nn
