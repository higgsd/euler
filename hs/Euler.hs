module Euler (
    intSqrt, wordScore, digitFactorial, solveQuadratic, modPow, sqrtExpansion,
    expConvergents,
    nChooseK, countPartsA, countParts, countPartsRestricted,
    fibonacci, triangular, square, pentagonal, hexagonal, heptagonal, octagonal,
    allPrimes, primeSieve, primeFactors, primeFactorsP,
    divisorPowerSum, isPrimeSimple,
    digitUsage, digitUsagePad, digitSum, toDigitsBase, fromDigits,
    parseList, listParser, readGrid, readMatrix, readWords,

    radicalSieve,
    splitOn,
    isSpecialSumSet, repunitAN
) where

import Control.Applicative((<*), many)
import qualified Data.Attoparsec.ByteString.Char8 as
       AP(char, decimal, endOfInput, endOfLine, notChar, parseOnly, sepBy)
import Data.Array((!), listArray)
import Data.ByteString.Char8(pack)
import Data.Char(ord)
import Data.List((\\), genericDrop, genericReplicate, genericSplitAt,
                 genericTake, nub, subsequences)
import Data.Ratio((%), numerator)
import Math.NumberTheory.Moduli(powerModInteger)
import Math.NumberTheory.Powers.Squares(isSquare)
import Math.NumberTheory.Primes.Sieve(primes)
import Math.NumberTheory.Primes.Factorisation(factorise, sigma)
import Math.NumberTheory.Primes.Testing(isPrime)

-- misc
modPow b x m = powerModInteger b x m
intSqrt n = floor $ sqrt $ fromIntegral n
wordScore w = sum $ map (fromIntegral.score) w
    where score c = ord c - ord 'A' + 1

-- memoized
digitFactorial n = map calcFact [0..9] !! n
    where calcFact x = product [2..x]

solveQuadratic a b c
    | r1 >= 0 = r1
    | otherwise = r2
    where delta = sqrt (b * b - 4 * a * c)
          r1 = (delta - b) / (2 * a)
          r2 = (-delta - b) / (2 * a)

-- periodic fractions
-- see https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#
-- Continued_fraction_expansion

genSqrtExp (a,(s,a0,m,d)) = (a2,(s,a0,m2,d2))
    where m2 = d*a - m
          d2 = (s - m2^2) `div` d
          a2 = (a0 + m2) `div` d2

-- returns (integer portion, [periodic continued fraction values]
sqrtExpansion s = if isSquare s then (a0, []) else (a0, xs ++ [y])
    where a0 = intSqrt s
          as = map fst $ drop 1 $ iterate genSqrtExp (a0,(s,a0,0,1))
          (xs,(y:_)) = break (==2*a0) as

-- takes an expansion as provided by sqrtExpansion or similar
-- returns an infinite list of (numerator,denominator) convergents
genConv _ _ [] = error "genConv: empty"
genConv (x0,y0) (x1,y1) (b:bs) = (x2,y2) : genConv (x1,y1) (x2,y2) bs
    where x2 = b*x1 + x0
          y2 = b*y1 + y0
expConvergents (_,[]) = error "expConvergents: empty"
expConvergents (b0,(b1:bs)) = ab0 : ab1 : genConv ab0 ab1 xs
    where ab0 = (b0,1)
          ab1 = (b0*b1+1,b1)
          xs = cycle $ bs ++ [b1]

-- combinatorics
nChooseK _ 0 = 1
nChooseK n k = numerator $ product [(n+1-i) % i | i <- [1..k]]

-- https://en.wikipedia.org/wiki/Partition_(number_theory)#Recurrence_formula
-- unbounded list and map memoization are both too slow
-- bounds are required for arrays
countPartsA b = a
    where a = listArray (0,b) $ map calcParts [0..b]
          calcParts 0 = 1
          calcParts n = sum $ zipWith (*) (cycle [1,1,-1,-1]) (sumParts n)
          sumParts n = map (a!) (sumTerms n)
          sumTerms n = map (n-) $ takeWhile (n>=) $ drop 1 generalizedPentagonal
countParts n = countPartsA n ! n

-- count partitions using specific part sizes, e.g. coins
-- accepts a potentially-infinite list of part sizes, in increasing order
-- returns an infinite list of partition counts for each index
countPartsR ps i _ [] = genericDrop i ps
countPartsR ps i j (x:xs) = r ++ countPartsR ps2 j x xs
    where ps2 = a ++ zipWith (+) b ps2
          (a,b) = genericSplitAt x ps
          r = genericTake (j-i) $ genericDrop i ps
countPartsRestricted [] = error "countPartsRestricted: empty"
countPartsRestricted (x:xs) = countPartsR ps 0 x xs
    where ps = cycle $ 1:genericReplicate (x-1) 0

-- sequences
fibonacci = 1:genFib 0 1
    where genFib a b = (a+b) : genFib b (a+b)

genPoly x n i = (x+n) : genPoly (x+n) (n+i) i
triangular = genPoly 0 1 1
square = genPoly 0 1 2
pentagonal = genPoly 0 1 3
hexagonal = genPoly 0 1 4
heptagonal = genPoly 0 1 5
octagonal = genPoly 0 1 6

generalizedPentagonal = scanl (+) 0 xs
    where xs = concat $ zipWith (\x y -> [x]++[y]) [1,3..] [1..]

-- primes, factoring, divisors, etc.
allPrimes = primes
primeSieve n = takeWhile (n>=) primes
isPrimeSimple = isPrime
primeFactors = factorise

-- sigma 0 is the number of divisors
-- sigma 1 is the sum of all divisors
divisorPowerSum = sigma

-- digits
countDigits0 [] ns = ns
countDigits0 (x:xs) ns = countDigits0 xs ns2
    where (a,b) = genericSplitAt x ns
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
parseList p s = case AP.parseOnly (p <* AP.endOfInput) (pack s) of
                Left e -> error $ "readList: " ++ e
                Right xs -> filter (not.null) xs
listParser c f = lineParser c f `AP.sepBy` AP.endOfLine
lineParser c f = f `AP.sepBy` (AP.char c)

readGrid s = parseList (listParser ' ' AP.decimal) s
readMatrix s = parseList (listParser ',' AP.decimal) s
readWords s = parseList (lineParser ',' wordParser) s
    where wordParser = do
                AP.char '"'
                v <- many $ AP.notChar '"'
                AP.char '"'
                return v

-- XXX unsorted
primeFactorsP [] n = [n]
primeFactorsP (p:ps) n
    | p > intSqrt n = [n]
    | m == 0 = p : primeFactorsP (p:ps) d
    | otherwise = primeFactorsP ps n
    where (d,m) = n `divMod` p

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
