module Euler (
    intSqrt, wordScore, nChooseK, solveQuadratic, modPow,
    fibonacci, triangular, pentagonal, hexagonal,
    allPrimes, primeSieve, primeFactors, primeFactorsP, allDivisors,
    allDivisorsP, isPrimeSimple,
    digitUsage, digitUsagePad, digitSum, toDigitsBase, fromDigits,
    readMatrix, readWords,

    radicalSieve,
    splitOn, loadMatrixFile,
    isSpecialSumSet, repunitAN
) where
import Control.Applicative((<*), many)
import qualified Data.Attoparsec.ByteString.Char8 as AP
import Data.ByteString.Char8(pack)
import Data.Char(ord)
import Data.List((\\), nub, sort, subsequences)
import Data.Ratio((%), numerator)
import Math.Sieve.ONeill(primes)

-- misc
intSqrt n = floor $ sqrt $ fromIntegral n
wordScore w = sum $ map (fromIntegral.score) w
    where score c = ord c - ord 'A' + 1

nChooseK _ 0 = 1
nChooseK n k = numerator $ product [(n+1-i) % i | i <- [1..k]]

solveQuadratic a b c
    | r1 >= 0 = r1
    | otherwise = r2
    where delta = sqrt (b * b - 4 * a * c)
          r1 = (delta - b) / (2 * a)
          r2 = (-delta - b) / (2 * a)

-- binary method = x^n mod d
modPow x n d = fst $ iterate modPow0 (1, (x `mod` d, n)) !! v
    where v = (floor $ logBase 2 $ fromIntegral n) + 1
          modPow0 (r,(b,e)) = (if odd e then r*b `mod` d else r,
                               (b^2 `mod` d, e `div` 2))

-- sequences
fibonacci = 1:genFib 0 1
    where genFib a b = (a+b) : genFib b (a+b)
triangular = genTri 0 1
    where genTri t i = (t+i) : genTri (t+i) (i+1)
pentagonal = genPent 0 1
    where genPent p i = (p+i) : genPent (p+i) (i+3)
hexagonal = genHex 0 1
    where genHex p i = (p+i) : genHex (p+i) (i+4)

-- primes, factoring, etc.
allPrimes = primes
primeSieve n = takeWhile (n>=) primes

primeFactorsP [] n = [n]
primeFactorsP (p:ps) n
    | p > intSqrt n = [n]
    | m == 0 = p : primeFactorsP (p:ps) d
    | otherwise = primeFactorsP ps n
    where (d,m) = n `divMod` p
primeFactors n = primeFactorsP allPrimes n

allDivisorsP ps n = sort $ nub $ map product $ subsequences $ primeFactorsP ps n
allDivisors n = allDivisorsP (primeSieve $ intSqrt n) n

isPrimeSimple n
    | n < 2 = False
    | n == 2 = True
    | even n = False
    | otherwise = all (\p -> n `mod` p /= 0) [3,5..intSqrt n]

-- digits
countDigits0 [] ns = ns
countDigits0 (x:xs) ns = countDigits0 xs ns2
    where (a,b) = splitAt x ns
          ns2 = a ++ [head b + 1] ++ (drop 1 b)
countDigits xs = countDigits0 xs $ replicate 10 0

digitUsagePad p n = countDigits (ds ++ replicate (p - length ds) 0)
    where ds = toDigitsBase 10 n
digitUsage n = countDigits $ toDigitsBase 10 n

digitSum n = sum $ toDigitsBase 10 n

toDigitsBase0 b n
    | n == 0 = [0]
    | d == 0 = [m]
    | otherwise = m : toDigitsBase0 b d
    where (d,m) = n `divMod` b
toDigitsBase b n = reverse $ toDigitsBase0 b n

fromDigits ds = sum $ zipWith (*) (reverse ds) (iterate (10*) 1)

-- parsing
readMatrix s = case AP.parseOnly (matrixParser <* AP.endOfInput) (pack s) of
                Left e -> error $ "readMatrix: " ++ e
                Right xs -> filter (not.null) xs
    where matrixParser = lineParser `AP.sepBy` AP.endOfLine
          lineParser = AP.decimal `AP.sepBy` (AP.char ' ')

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
    where calcRad y = (y, product $ nub $ primeFactorsP pp y)
          pp = primeSieve $ intSqrt n

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
