-- 5777
import Euler

nn = 10000

oddComps = [ n | n <- [3,5..], not $ isPrimeSimple n ]
failsConj = [ n | n <- oddComps, not $ meetsConj n ]
    where primesLess n = takeWhile (n >) $ primeSieve nn
          doHalve n = (fromIntegral n) / 2
          isIntegral n = n == (fromIntegral $ floor n)
          isSqrt n = isIntegral . sqrt . doHalve . (\x -> n - x)
          meetsConj n = any (isSqrt n) $ primesLess n

main = putStrLn $ show $ head $ failsConj
