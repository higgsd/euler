-- 76576500
import Euler(allFactors)

findTri (t,i)
    | length (allFactors t) > 500 = t
    | otherwise = findTri (t+i,i+1)

main = putStrLn $ show $ findTri (0,1)
