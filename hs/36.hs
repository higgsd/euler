-- 872187
import Euler(fromDigits, toDigitsBase)

nn = 6

-- generate all base-10 palindromes
genPalin10 1 = [1..9]
genPalin10 n
    | even n = map fromDigits xs ++ genPalin10 (n-1)
    | otherwise = map fromDigits ys ++ genPalin10 (n-1)
    where xs = [a ++ reverse a | a <- zs]
          ys = [a ++ [b] ++ reverse a | a <- zs, b <- [0..9]]
          k = n `div` 2
          zs = map (toDigitsBase 10) [10^(k-1)..10^k-1]

-- only odd numbers can be base-2 palindromic
sumPalindromes n = sum $ filter isPalin2 $ filter odd $ genPalin10 n
    where isPalin2 x = isPalindrome $ toDigitsBase 2 x
          isPalindrome xs = xs == reverse xs

main = putStrLn $ show $ sumPalindromes nn
