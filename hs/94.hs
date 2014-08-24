-- 518408346
import Euler(solveQuadratic)

pp = 1000000000

calcLongBase h = 2 * solveQuadratic 3 (-4) (1 - hf * hf)
    where hf = fromIntegral h
calcShortBase h = 2 * solveQuadratic 3 4 (1 - hf * hf)
    where hf = fromIntegral h

findShortBase h
    | b == ceiling bx = p : findLongBase (p-1)
    | otherwise = findShortBase (h+1)
    where bx = calcShortBase h
          b = floor bx
          p = 3 * b + 2
findLongBase h
    | b == ceiling bx = p : findShortBase (p-1)
    | otherwise = findLongBase (h+1)
    where bx = calcLongBase h
          b = floor bx
          p = 3 * b - 2
findPerims = findLongBase 4

main = putStrLn $ show $ sum $ takeWhile (pp>) $ findPerims
