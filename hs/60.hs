-- 26033
import Data.List.Ordered(has)
import Data.Map.Strict((!), empty, insert, keys)
import Euler(allPrimes, fromDigits, isPrimeSimple, toDigitsBase)

nn = 5

buildSets n xs ys
    | length xs == n = [sum xs]
    | otherwise = concat [buildSets n (x:xs) ys2 |
                          (x,zs) <- ys, let ys2 = pruneSet zs ys]
    where pruneSet ks rs = filter (\(r,_) -> ks `has` r) rs
minSet n p xs = if null ys then 0 else minimum ys
    where ys = buildSets n [p] xs

-- should technically keep searching to confirm first prime set is minimum
-- use minimum 4-set, done when next prime > current sum + min 4-set

findSet0 _ _ [] = error "findSet0: empty"
findSet0 n t (p:ps) = if s /= 0 then s else findSet0 n t2 ps
    where s = minSet n p $ zip ks $ map (t!) ks
          ks = filter isPrimePair (keys t)
          pd = toDigitsBase 10 p
          isPrimePair x = isPrimeAB pd (toDigitsBase 10 x) &&
                          isPrimeAB (toDigitsBase 10 x) pd
          isPrimeAB a b = isPrimeSimple $ fromDigits (a ++ b)
          t2 = insert p ks t
findSet n = findSet0 n empty allPrimes

main = putStrLn $ show $ findSet nn
