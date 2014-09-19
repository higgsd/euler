module Euler (
    fibonacci, intSqrt, wordScore, primeSieve, primeFactors, allDivisors,
    allDivisorsP, nChooseK, readMatrix, readWords,
    radicalSieve, isPrimeSimple,
    splitOn, loadMatrixFile,
    digitUsage, digitUsagePad, digitSum,
    solveQuadratic, isPentagonal,
    isSpecialSumSet, repunitAN, modPow
) where
import Control.Applicative((<*), many)
import qualified Data.Attoparsec.ByteString.Char8 as AP
import Data.ByteString.Char8(pack)
import Data.Char(ord)
import Data.List((\\), group, nub, sort, subsequences)
import Data.Ratio((%), numerator)
import Math.Sieve.ONeill(primes)

-- misc
fibonacci = 1:genFib 0 1
    where genFib a b = (a+b) : genFib b (a+b) 
intSqrt n = floor $ sqrt $ fromIntegral n
wordScore w = sum $ map (\c -> ord c - ord 'A' + 1) w

-- primes, factoring, etc.
primeSieve n = takeWhile (n>=) primes

primeFactors [] n = [n]
primeFactors (p:ps) n
    | p >= n = [n]
    | m == 0 = p : primeFactors (p:ps) d
    | otherwise = primeFactors ps n
    where (d,m) = n `divMod` p

allDivisorsP ps n = sort $ nub $ map product $ subsequences $ primeFactors ps n
allDivisors n = allDivisorsP (primeSieve $ intSqrt n) n

-- combinatorics
nChooseK _ 0 = 1
nChooseK n k = numerator $ product [(n+1-i) % i | i <- [1..k]]

-- parsing
readMatrix s = case AP.parseOnly (matrixParser <* AP.endOfInput) (pack s) of
                Left e -> error $ "readMatrix: " ++ e
                Right xs -> filter (not.null) xs
    where matrixParser = lineParser `AP.sepBy` AP.endOfLine
          lineParser = intParser `AP.sepBy` (AP.char ' ')
          intParser :: AP.Parser Int
          intParser = do
              v <- AP.count 2 AP.digit
              return $ read v

readWords s = case AP.parseOnly (lineParser <* AP.endOfInput) (pack s) of
                Left e -> error $ "readWords: " ++ e
                Right xs -> xs
    where lineParser = wordParser `AP.sepBy` (AP.char ',')
          wordParser = do
                AP.char '"'
                v <- many $ AP.notChar '"'
                AP.char '"'
                return v

-- XXX unsorted
radicalSieve n = map calcRad [0..n]
    where calcRad y = (y, product $ nub $ primeFactors pp y)
          pp = primeSieve $ intSqrt n

isPrimeSimple n
    | n < 2 = False
    | n == 2 = True
    | even n = False
    | otherwise = all (\p -> n `mod` p /= 0) [3,5..intSqrt n]

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

-- binary method
modPow x n d = fst $ iterate modPow0 (1, (x `mod` d, n)) !! v
    where v = ceiling $ logBase 2 $ fromIntegral n
          modPow0 (r,(b,e)) = (if odd e then r*b `mod` d else r,
                               (b^2 `mod` d, e `div` 2))
