-- 756872327473
-- via http://www.mathblog.dk/project-euler-100-blue-discs-two-blue/
-- recurrence via http://www.alpertron.com.ar/QUAD.HTM

nn = 10^12

xyGen0 x y = (x,y) : xyGen0 x2 y2
    where x2 = 3*x + 2*y - 2
          y2 = 4*x + 3*y - 3
xyGen = xyGen0 15 21

main = putStrLn $ show $ fst $ head $ dropWhile (\(_,y) -> y <= nn) xyGen
