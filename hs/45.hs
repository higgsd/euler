-- 1533776805
import Data.List.Ordered(isect, member)
import Euler(triangular, pentagonal, hexagonal)

nn = 143

-- walk the pentagonal and triangular lists
-- check whether the hexagonal value is in them
-- also provide the remainder of each list for the next check
walkSet n ps ts = (member n $ isect ps2 ts2, ps3, ts3)
    where (ps2,ps3) = span (n>=) ps
          (ts2,ts3) = span (n>=) ts

findTriple0 [] _ _ = error "findTriple0: empty"
findTriple0 (x:xs) ps ts = if f then x else nf
    where (f,ps2,ts2) = walkSet x ps ts
          nf = findTriple0 xs ps2 ts2
findTriple n = findTriple0 (drop n hexagonal) pentagonal triangular

main = putStrLn $ show $ findTriple nn
