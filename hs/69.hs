-- 510510
import Euler(allPrimes)

nn = 1000000

-- maximize n / phi(n) by finding minimal phi(n)
-- more factors => lower phi number
-- more prime factors => even lower phi number (can build more divisors)
-- if x mod n == 0 then phi(x) = phi(x*n)
-- since there is a single maximum, just multiply by primes
findMaxRatio n = last $ takeWhile (n>=) genMinPhi
    where genMinPhi = map (product . flip take allPrimes) [1..]

main = putStrLn $ show $ findMaxRatio nn
