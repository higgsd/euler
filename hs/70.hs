-- 8319823
import Data.Function(on)
import Data.List(minimumBy, sort)
import Euler(allPrimes, intSqrt, toDigitsBase)

nn = 10^7

-- minimize n / phi(n) by finding maximal phi(n)
-- fewer factors => higher phi number, so build n from two primes
-- only check primes within +/- order of magnitude of sqrt(n)
totientPerms n = [(x,p) | a <- aPrimes, b <- bPrimes a,
                          let x = a*b, let p = (a-1)*(b-1), isPerm x p]
    where q = intSqrt n
          aPrimes = takeWhile (q>) $ dropWhile (q `div` 10>) allPrimes
          bPrimes a = takeWhile (n `div` a>) $ dropWhile (a>) allPrimes
          isPerm a b = permSort a == permSort b
          permSort x = sort $ toDigitsBase 10 x

bestPerm n = fst $ minimumBy (compare `on` phiRatio) $ totientPerms n
    where phiRatio (x,p) = fromIntegral x / fromIntegral p

main = putStrLn $ show $ bestPerm nn
