module Euler (
    intSqrt, primeSieve, isPrimeSimple,
    allFactors, primeFactors,
    splitOn, loadMatrixFile, loadWordFile, wordScore,
    digitUsage, digitUsagePad,
    solveQuadratic, isPentagonal,
    isSpecialSumSet
) where
import Data.Char(ord)
import Data.List(nub, sort, group, subsequences, (\\))

intSqrt n = floor $ sqrt $ fromIntegral n

buildSieve _ [] = []
buildSieve n (x:xs)
    | x > (intSqrt n) = (x:xs)
    | otherwise = (x:buildSieve n s)
    where s = [ y | y <- xs, y `mod` x /= 0 ]
primeSieve n = buildSieve n [2..n]

isPrimeSimple n
    | n < 2 = False
    | n == 2 = True
    | even n = False
    | otherwise = all checkFactor [3,5..intSqrt n]
    where checkFactor d = n `mod` d /= 0

buildFactors _ [] = []
buildFactors n (d:ds)
    | n == d * d = [d]
    | n `mod` d == 0 = [d] ++ f ++ [n `div` d]
    | otherwise = f
    where f = buildFactors n ds
allFactors n = buildFactors n [1..intSqrt n]

primeFactors n [] = [n]
primeFactors n (p:ps)
    | p >= n = [n]
    | n `mod` p == 0 = p : primeFactors (n `div` p) (p:ps)
    | otherwise = primeFactors n ps

-- adapted from GHC 'lines'
splitOn _ "" = []
splitOn c s = cons (case break (== c) s of
    (l, s') -> (l, case s' of
        [] -> []
        _:s'' -> splitOn c s''))
    where cons ~(h, t) = h : t

loadMatrixFile :: String -> IO [[Integer]]
loadMatrixFile fname = do
    contents <- readFile fname
    return $ map (\x -> map read $ splitOn ',' x) $ lines contents

loadWordFile fname = do
    contents <- readFile fname
    return $ map dropQuotes $ splitOn ',' contents
        where dropQuotes s = reverse $ drop 1 $ reverse $ drop 1 s

wordScore word = sum $ map alphaOrd word
    where alphaOrd c = ord c - ord 'A' + 1

digitUsageStr s = countDigit "0123456789" $ group $ sort s
    where countDigit [] _ = []
          countDigit (_:cs) [] = 0 : countDigit cs []
          countDigit (c:cs) (x:xs)
            | c == head x = length x : countDigit cs xs
            | otherwise = 0 : countDigit cs (x:xs)
digitUsagePad n p = digitUsageStr (s ++ replicate (p - length s) '0')
    where s = show n
digitUsage n = digitUsageStr $ show n

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
