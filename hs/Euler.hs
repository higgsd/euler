module Euler (
    intSqrt, primeSieve, nfactorSieve,
    isPrime, isPrimeSimple,
    allFactors, countFactors,
    splitOn, loadMatrixFile, loadWordFile, wordScore,
    digitUsage, digitUsagePad,
    solveQuadratic, isTriangular, isPentagonal,
    isSpecialSumSet
) where
import Data.Char(ord)
import Data.List(nub, sort, group, subsequences, (\\))
import Data.Array(listArray, (//), (!))

intSqrt n = floor $ sqrt $ fromIntegral n

buildSieve _ [] = []
buildSieve n (x:xs)
    | x > (intSqrt n) = (x:xs)
    | otherwise = (x:buildSieve n s)
    where s = [ y | y <- xs, y `mod` x /= 0 ]
primeSieve n = buildSieve n [2..n]

nfactorSieve n = map (\x -> length x - 1) $ group $ sort ps
    where ps = concat $ [0..n] : [ [x*2,x*3..n] | x <- primeSieve n ]

genPrimeArray primes = a // [(p,True) | p <- primes]
    where a = listArray (0,last primes) $ repeat False
isPrime primes n
    | n > last primes = False
    | otherwise = (genPrimeArray primes) ! n

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

countFactors n = length $ allFactors n

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

-- strDigitUsage [] 0 = 0
-- strDigitUsage _ 0 = error "strDigitUsage: chars left"
-- strDigitUsage [] _ = 1
-- strDigitUsage (c:s) d = n .|. strDigitUsage s (d-1)
--     where n = shift 1 $ ord c - ord '0'

-- digitUsage :: Integer -> Integer -> Integer
-- digitUsage n d
--     | d == 0 = strDigitUsage s $ length s
--     | otherwise = strDigitUsage s d
--     where s = show n

strDigitUsage s = countDigit "0123456789" $ group $ sort s
    where countDigit [] _ = []
          countDigit (_:cs) [] = 0 : countDigit cs []
          countDigit (c:cs) (x:xs)
            | c == head x = length x : countDigit cs xs
            | otherwise = 0 : countDigit cs (x:xs)

digitUsagePad n p = strDigitUsage (s ++ replicate (p - length s) '0')
    where s = show n 
digitUsage n = strDigitUsage $ show n

solveQuadratic a b c
    | r1 >= 0 = r1
    | otherwise = r2
    where delta = sqrt (b * b - 4 * a * c)
          r1 = (delta - b) / (2 * a)
          r2 = (-delta - b) / (2 * a)

isTriangular n = r == (fromIntegral $ floor r)
    where r = solveQuadratic 0.5 0.5 (fromIntegral $ -n)

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
