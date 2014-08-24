-- 31875000

isTriple a b c
    | a * a + b * b == c * c = True
    | otherwise = False

findTripleProd n = head [ a * b * c | (a,b,c) <- xs, isTriple a b c ]
    where xs = [ (a,b,n-a-b) | a <- [1..n], b <- [a+1..n-a], n-a-b > b ]

main = putStrLn $ show $ findTripleProd 1000
