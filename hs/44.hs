-- 5482660
import Euler(pentagonal, solveQuadratic)

-- find pentagonal sum a+b first
-- find first a that produces pentagonal b and b-a
-- minimal sum happens to also produce minimal difference
-- smarter/faster algorithm required if checking minimal differences

isPentagonal n = r == (fromIntegral $ floor r)
    where r = solveQuadratic 1.5 (-0.5) (fromIntegral $ -n)

findPent = head [b-a | c <- pentagonal, a <- takeWhile (c `div` 2>) pentagonal,
                       let b = c-a, isPentagonal b, isPentagonal (b-a)]

main = putStrLn $ show $ findPent
