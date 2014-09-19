-- 2783915460
import Data.List(delete)

nn = 1000000

-- recursive, lexographic sort
-- append suffixes in increasing order
lexPerms0 a [] = [a]
lexPerms0 a bs = concat [lexPerms0 (a ++ [b]) (delete b bs) | b <- bs]
lexPerms xs = lexPerms0 [] xs

main = putStrLn $ lexPerms "0123456789" !! (nn-1)
