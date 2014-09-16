module Euler (
    intSqrt, primeSieve, radicalSieve, isPrimeSimple,
    allFactors, primeFactors,
    splitOn, loadMatrixFile, loadWordFile, wordScore,
    digitUsage, digitUsagePad, digitSum,
    solveQuadratic, isPentagonal,
    isSpecialSumSet, repunitAN, nChooseK
) where
import Data.Char(ord)
import Data.List(nub, sort, group, subsequences, (\\))
import Data.Ratio((%), numerator)

intSqrt n = floor $ sqrt $ fromIntegral n

buildSieve [] _ = []
buildSieve (p:ps) n
    | p > intSqrt n = (p:ps)
    | otherwise = p : buildSieve (filter (\y -> y `mod` p /= 0) ps) n
primeSieve n = buildSieve [2..n] n

radicalSieve n = map calcRad [0..n]
    where calcRad y = (y, product $ nub $ primeFactors pp y)
          pp = primeSieve $ intSqrt n

isPrimeSimple n
    | n < 2 = False
    | n == 2 = True
    | even n = False
    | otherwise = all (\p -> n `mod` p /= 0) [3,5..intSqrt n]

buildFactors [] _ = []
buildFactors (d:ds) n
    | n == d * d = [d]
    | m == 0 = [d] ++ fs ++ [r]
    | otherwise = fs
    where fs = buildFactors ds n
          (r,m) = n `divMod` d
allFactors n = buildFactors [1..intSqrt n] n

primeFactors [] n = [n]
primeFactors (p:ps) n
    | p >= n = [n]
    | m == 0 = p : primeFactors (p:ps) d
    | otherwise = primeFactors ps n
    where (d,m) = n `divMod` p

-- adapted from GHC 'lines'
splitOn _ "" = []
splitOn c s = cons (case break (== c) s of
    (l, s2) -> (l, case s2 of
        [] -> []
        (_:s3) -> splitOn c s3))
    where cons ~(h, t) = h : t

loadMatrixFile fname = do
    contents <- readFile fname
    return $ map (\x -> map read $ splitOn ',' x) $ lines contents

loadWordFile fname = do
    contents <- readFile fname
    return $ map (tail.init) $ splitOn ',' contents

wordScore w = sum $ map (\c -> ord c - ord 'A' + 1) w

digitUsageStr s = countDigit "0123456789" $ group $ sort s
    where countDigit [] _ = []
          countDigit (_:cs) [] = 0 : countDigit cs []
          countDigit (c:cs) (x:xs)
            | c == head x = length x : countDigit cs xs
            | otherwise = 0 : countDigit cs (x:xs)
digitUsagePad n p = digitUsageStr (s ++ replicate (p - length s) '0')
    where s = show n
digitUsage n = digitUsageStr $ show n

digitSum 0 = 0
digitSum n = m + digitSum d
    where (d,m) = n `divMod` 10

solveQuadratic a b c
    | r1 >= 0 = r1
    | otherwise = r2
    where delta = sqrt (b * b - 4 * a * c)
          r1 = (delta - b) / (2 * a)
          r2 = (-delta - b) / (2 * a)

isPentagonal n = r == (fromIntegral $ floor r)
    where r = solveQuadratic 1.5 (-0.5) (fromIntegral $ -n)

isSpecialSumSet a
    | nub a /= a = False
    | otherwise = and [cmpSets b c | b <- subsequences a, length b > 0, b /= a,
                                     let xs = a \\ b,
                                     c <- subsequences xs, length c > 0, c > b]
    where cmpSets b c
            | length b > length c = sb > sc
            | length c > length b = sc > sb
            | otherwise = sb /= sc
            where sb = sum b
                  sc = sum c

repunitAN0 r k n
    | r2 == 0 = (k+1)
    | otherwise = repunitAN0 r2 (k+1) n
    where r2 = (10*r+1) `mod` n
repunitAN n = if gcd n 10 == 1 then repunitAN0 1 1 n else 0

nChooseK _ 0 = 1
nChooseK n k = numerator $ product [(n+1-i) % i | i <- [1..k]]
