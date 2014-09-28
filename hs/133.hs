-- 453647705
import Euler(modPow, primeSieve)

nn = 10^5

-- if R(10^n) is divisible by p, R(10^(n+1)) is too
-- number of checks found by trial and error
tt = 20

-- R(n) = (10^n-1) / 9
-- p divides R(n) if (10^n-1) / 9 mod p = 0
--                   10^n - 1 mod 9p = 0
--                   10^n mod 9p = 1
-- R(10^n) when 10^(10^n) mod 9p = 1

dividesR p = any dividesR0 [1..tt]
    where dividesR0 n = modPow 10 (10^n) (9*p) == 1

main = putStrLn $ show $ sum $ filter (not.dividesR) $ primeSieve nn
