-- 18407904
import Data.Function(on)
import Data.List(sortBy)
import Euler(enumerate, radicalSieve)

cc = 120000
rr = sortBy (compare `on` snd) $ drop 1 $ enumerate $ radicalSieve cc

genTriples = [c | (c,rc) <- rr, c > rc,
                  (a,ra) <- takeWhile (\(_,rx) -> c > rx*rc*2) rr,
                  c > a + a,
                  (b,rb) <- takeWhile (\(_,rx) -> c > rx*ra*rc) rr,
                  a + b == c, gcd ra rb == 1]

main = putStrLn $ show $ sum $ genTriples
