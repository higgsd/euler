-- 16695334890
import Data.List(delete)
import Euler(fromDigits, primeSieve)

-- incrementally construct pandigital values
-- check prime requirements with each recursion
genDigits xs [] _ = [xs]
genDigits _ _ [] = error "genDigits: empty"
genDigits xs ys (p:ps) = concat [genDigits (x:xs) (delete x ys) ps | x <- ys,
                         (fromDigits $ reverse $ x:take 2 xs) `mod` p == 0]

sumAll = sum $ map (fromDigits.reverse) $
         genDigits [] [0..9] (1:1:1:primeSieve 1000)

main = putStrLn $ show $ sumAll
