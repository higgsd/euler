-- 7587457
import Data.List(delete, sort, nub, (\\), intersect)
import Euler(primeSieve, primeFactors)

kk = 12000
primes = primeSieve $ 2 * kk

subPerms [] = error "subPerms: empty"
subPerms [_] = error "subPerms: singleton"
subPerms xs = [sort $ (x*y):zs | x <- nub xs, let ys = delete x xs,
                                 y <- nub ys, let zs = delete y ys]

genPerms0 [] = error "genPerms: empty"
genPerms0 xs
    | (length . head) xs == 2 = []
    | otherwise = nextPerms ++ genPerms0 nextPerms
    where nextPerms = nub $ concatMap subPerms xs
genPerms xs = xs : genPerms0 [xs]

genCoverage n
    | n `elem` primes = []
    | otherwise = ys
    where xs = genPerms $ primeFactors n primes
          ys = nub $ map (\x -> n - sum x + length x) xs

calcSums0 [] _ s = s
calcSums0 ks n s
    | null (ks `intersect` c) = calcSums0 ks (n+1) s
    | otherwise = calcSums0 (ks \\ c) (n+1) (n+s)
    where c = genCoverage n
calcSums k = calcSums0 [2..k] 2 0

main = putStrLn $ show $ calcSums kk
