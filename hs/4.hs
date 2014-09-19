-- 906609
kk = 3

largestPalin k = maximum [x*y | x <- [a..b], y <- [x..b], isPalindrome (x*y)]
    where isPalindrome n = show n == (reverse $ show n)
          a = 10^(k-1)
          b = 10^k-1

main = putStrLn $ show $ largestPalin kk
