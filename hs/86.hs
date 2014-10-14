-- 1818
import Math.NumberTheory.Powers.Squares(isSquare)

nn = 1000000

-- accumulate number of valid cuboids w/ each increase in dimensions
-- enumerate integer solutions to sqrt(z^2 + (x+y)^2)
-- number of solutions varies depending on x+y versus z
findCuboidSide0 n m s = if s2 >= n then m else findCuboidSide0 n (m+1) s2
    where s2 = s + (sum $ map uniqueCuboids enumRights)
          uniqueCuboids xy = if m >= xy then xy `div` 2
                             else 1 + m - (xy+1) `div` 2
          enumRights = filter (\xy -> isSquare $ xy^2 + m^2) [2..2*m]
findCuboidSide n = findCuboidSide0 n 1 0

main = putStrLn $ show $ findCuboidSide nn
