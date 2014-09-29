-- 669171001
nn = 1001

sumDiags n = sum $ map sumLayer [1,3..n]
    where sumLayer 1 = 1
          sumLayer x = 4*x^2 - 6*x + 6

main = putStrLn $ show $ sumDiags nn
