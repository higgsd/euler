-- 1322
import Euler(intSqrt)

nn = 10000

genSeq n (a,b,d) = (ax,bx,dx):genSeq n (a,bx,dx)
    where dx = (n - b ^ 2) `div` d
          bx = a - ((a + b) `mod` dx)
          ax = (a + bx) `div` dx

genSqrt n
    | a0 ^ 2 == n = []
    | otherwise = nseq
    where a0 = intSqrt n
          (abd:rseq) = genSeq n (a0,a0,1)
          nseq = abd:takeWhile (/= abd) rseq

main = putStrLn $ show $ length $ filter odd $ map (length . genSqrt) [1..nn]
