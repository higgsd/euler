-- 104743
import Math.Sieve.ONeill(primesToNth)

nn = 10001

main = putStrLn $ show $ last $ primesToNth nn
