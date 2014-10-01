-- 28684
import Euler(triangular, square, pentagonal, hexagonal, heptagonal, octagonal)

kk = 4

-- when constructing sets, accumulate both values and sequences in use
-- start initial set with the smallest sequence, to search faster
-- ignore all values from sequences already in use
-- also discard all values that can't be 4-digit cyclic
findCycle k xs ns
    | length xs == length ps = if cyclic (head xs) (last xs)
                               then [xs] else []
    | null xs = concat [findCycle k (x:xs) (n:ns) |
                        let (n,fs) = last ps, x <- fs]
    | otherwise = concat [findCycle k (x:xs) (n:ns) |
                          (n,fs) <- ps, n `notElem` ns,
                          x <- fs, cyclic (head xs) x]
    where cyclic x y = x `mod` 100 == y `div` 100
          ps = zip [0..] $ map genSeq [triangular, square, pentagonal,
                                       hexagonal, heptagonal, octagonal]
          genSeq f = filter (\x -> x `mod` 100 <= 9) $
                     dropWhile (10^(k-1)>=) $ takeWhile ((10^k-1) >) f

sumCycle k = sum $ head $ findCycle k [] []

main = putStrLn $ show $ sumCycle kk
