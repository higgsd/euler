-- 428570
import Data.List(sort)
import Data.Ratio((%), numerator, denominator)

mm = 1000000
cc = 1000
nn = 3
dd = 7
ff = nn % dd

getNearFrac d = (d * nn `div` dd) % d

nearestFracs = sort $ [ f | d <- [mm,mm-1..mm-cc], let f = getNearFrac d,
                 f /= ff, denominator f == d ]

main = putStrLn $ show $ numerator $ last $ nearestFracs
