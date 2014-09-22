-- 906609
import Euler(toDigitsBase)

kk = 3

largestPalin k = maximum [x*y | x <- [a..b], y <- [x..b],
                                isPalindrome $ toDigitsBase 10 (x*y)]
    where isPalindrome ds = ds == reverse ds
          a = 10^(k-1)
          b = 10^k-1

main = putStrLn $ show $ largestPalin kk
