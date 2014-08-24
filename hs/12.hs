-- 76576500
import Euler

findTri (t,i)
    | countFactors t > 500 = t
    | otherwise = findTri (t+i,i+1)

main = putStrLn $ show $ findTri (0,1)
