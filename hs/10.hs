-- 142913828922
import Euler(primeSieve)

nn = 2000000

primeSum n = sum $ primeSieve n

main = putStrLn $ show $ primeSum nn
