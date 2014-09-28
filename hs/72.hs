-- 303963552391
import Euler(primeFactors)

nn = 1000000

-- count positive integers that are smaller than and relatively prime to x
totient x = x * n `div` d
    where fs = map fst (primeFactors x)
          n = product $ map (+ (-1)) fs
          d = product fs

main = putStrLn $ show $ sum $ map totient [2..nn]
