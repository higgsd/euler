-- 104743
import Math.Sieve.ONeill(primesToNth)

nn = 10001

getPrime n = last $ primesToNth n

main = putStrLn $ show $ getPrime nn
