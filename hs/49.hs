-- 296962999629
import Data.List.Ordered(has)
import Euler(digitUsage, primeSieve)

xx = 1487
ii = 3330
kk = 4

findTriples x i k = head [a*10^(k*2) + b*10^k + c |
                          a <- ps, a /= x, let b = a+i, let c = b+i,
                          digitUsage a == digitUsage b,
                          digitUsage b == digitUsage c,
                          ps `has` b, ps `has` c]
    where ps = dropWhile (10^(k-1)>) $ primeSieve (10^k)

main = putStrLn $ show $ findTriples xx ii kk
