-- 1366

powerSum n = sum $ map readDigit $ show $ floor $ 2 ** n
    where readDigit c = read [c]

main = putStrLn $ show $ powerSum 1000
