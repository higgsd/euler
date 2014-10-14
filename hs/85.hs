-- 2772
import Euler(triangular)

nn = 2000000

-- number of sub-rectangles = products of length and width triangular numbers
-- generate all unique combinations of length and width up to the max
nearestRectCount n = snd $ maximum $ map last $
                     takeWhile (not.null) $ map countX [1..]
    where countX x = takeWhile (\(c,_) -> n>=c) [(count x y, x*y) | y <- [x..]]
          count x y = (triangular !! (x-1)) * (triangular !! (y-1))

main = putStrLn $ show $ nearestRectCount nn
