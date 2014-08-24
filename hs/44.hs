-- 5482660
import Euler(isPentagonal)

genPent = filter even $ map calcPent [1..]
    where calcPent i = i * (3 * i - 1) `div` 2

findPent = [ i - j | i <- genPent, j <- takeWhile (i >) genPent,
                     isPentagonal $ i - j, isPentagonal $ i + j ]

main = putStrLn $ show $ head findPent
