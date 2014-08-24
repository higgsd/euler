-- 906609

isPalindrome n = show n == (reverse $ show n)

largest = maximum [ x * y | x <- [100..999],
                            y <- [x+1..999], isPalindrome $ x * y ]

main = putStrLn $ show $ largest
