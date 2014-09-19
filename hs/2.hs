-- 4613732
import Euler(fibonacci)

nn = 4000000

sumFibs n = sum $ takeWhile (n>) $ filter even $ fibonacci

main = putStrLn $ show $ sumFibs nn
