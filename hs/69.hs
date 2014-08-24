-- 510510
import Euler(primeSieve)

nn = 1000000

-- if x mod n == 0, phi(x) == phi(x * n)
-- more factors = lower phi number
-- more prime factors = even lower phi number

maxPhi = map (product . flip take primes) [1..length primes]
    where primes = primeSieve 50

main = putStrLn $ show $ last $ takeWhile (nn>) maxPhi
