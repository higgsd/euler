-- 232792560
nn = 20

tryReduce n d = if m == 0 && isDivisible then tryReduce q d else n
    where (q,m) = n `divMod` d
          isDivisible = all (\x -> q `mod` x == 0) [2..nn]

reduceAll = foldl tryReduce p [2..nn]
    where p = product [2..nn]

main = putStrLn $ show $ reduceAll
