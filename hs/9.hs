-- 31875000
nn = 1000

findProd n = head [a*b*c | a <- [1..n-2], b <- [a+1..n-a-1],
                           let c = n-a-b, c > b, a*a + b*b == c*c]

main = putStrLn $ show $ findProd nn
