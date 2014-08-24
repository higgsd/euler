-- 872187
nn = 1000000

inBase2 n
    | n == 0 = ""
    | n `mod` 2 == 0 = (inBase2 nx) ++ "0"
    | otherwise = (inBase2 nx) ++ "1"
    where nx = n `div` 2

isPalindrome s = s == (reverse s)

sumPalin [] = 0
sumPalin (n:ns)
    | isPalindrome n10 && isPalindrome n2 = n + nx
    | otherwise = nx
    where n2 = inBase2 n
          n10 = show n
          nx = sumPalin ns

main = putStrLn $ show $ sumPalin [1,3..nn]
