-- 232792560
nn = 20

tryReduce ds n d = if m == 0 && isDivisible then tryReduce ds q d else n
    where (q,m) = n `divMod` d
          isDivisible = all (\x -> q `mod` x == 0) ds

smallestMult n = foldl (tryReduce ds) p ds
    where p = product ds
          ds = [2..n]

main = putStrLn $ show $ smallestMult nn
