-- 612407567715
import Data.List((\\))
import Euler(isPrimeSimple)

nn = 10
kk = 10

buildNumber d xs ix = sum $ ys ++ zs
    where ys = zipWith (\x i -> x * kk^i) xs ix
          zs = map (\i -> d * kk^i) $ [0..nn-1] \\ ix

genPrimes0 d = filter isPrimeSimple [buildNumber d [] []]
genPrimes1 d = filter isPrimeSimple $
        [x | a <- [0..kk-1], a /= d, i <- [0..nn-1],
             let x = buildNumber d [a] [i], x >= kk^(nn-1)]
genPrimes2 d = filter isPrimeSimple $
        [x | a <- ks, a /= d, b <- ks, b /= d, i <- ns, j <- ns, i > j,
             let x = buildNumber d [a,b] [i,j], x >= kk^(nn-1)]
    where ks = [0..kk-1]
          ns = [0..nn-1]

genPrimes d
    | length xs /= 0 = xs
    | length ys /= 0 = ys
    | otherwise = genPrimes2 d
    where xs = genPrimes0 d
          ys = genPrimes1 d

main = putStrLn $ show $ sum $ concatMap genPrimes [0..kk-1]
