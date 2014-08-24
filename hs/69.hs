-- 510510
import Euler

nn = 1000000

-- if x mod n == 0, phi(x) == phi(x * n)
-- more factors = lower phi number
-- more prime factors = even lower phi number

maxPhi = map (product . flip take primes) [1..length primes]
    where primes = primeSieve 50

main = putStrLn $ show $ last $ takeWhile (nn>) maxPhi

-- phi n = n - (length $ map head $ group $ sort $ concat $ map genMult $ factors)
--     where factors = filter (\p -> mod n p == 0) $ primeSieve nn
--           genMult f = map (f*) [1..n `div` f]

