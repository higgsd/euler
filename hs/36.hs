-- 872187
import Euler(toDigitsBase)

nn = 1000000
bb = [2,10]

-- only odd numbers can be base-2 palindromic
sumPalindromes n bs = sum $ filter isPalinBoth [1,3..n]
    where isPalinBoth x = all (\b -> isPalindrome $ toDigitsBase b x) bs
          isPalindrome xs = xs == reverse xs

main = putStrLn $ show $ sumPalindromes nn bb
