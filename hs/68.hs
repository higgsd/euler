-- 6531031914842725
import Data.List((\\))
import Euler(fromDigits, toDigitsBase)

nn = 5

-- construct N-gon recursively
-- first enumerated edge first, must be smallest edge
-- then add remaining edges, must contain largest edge (for 16-digit string)
-- then add remaining centers, construct digit string, and check for magic
buildGons n gs
    | ng == n = if isMagic then [ys] else []
    | ng == 0 = concat [buildGons n [a] | a <- [1..n]]
    | ng < nh = concat [buildGons n (a:gs) | a <- [last gs+1..n] \\ gs]
    | ng == nh && n `notElem` gs = []
    | otherwise = concat [buildGons n (a:gs) | a <- [1..n-1] \\ gs]
    where nh = n `div` 2
          ng = length gs
          as = reverse $ drop nh gs
          bs = take nh gs
          cs = drop 1 $ cycle bs
          ys = zipWith3 (\a b c -> [a,b,c]) as bs cs
          (z:zs) = map sum ys
          isMagic = all (z==) zs

-- last item may not be largest due to digit sorting of "10"
bestGon n = maximum $ map toString $ buildGons (2*n) []
    where toString xs = fromDigits $ concat $ map (toDigitsBase 10) $ concat xs

main = putStrLn $ show $ bestGon nn
