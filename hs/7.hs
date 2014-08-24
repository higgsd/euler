-- 104743
import Euler(primeSieve)

main = putStrLn $ show $ (primeSieve 200000) !! (10001-1)
