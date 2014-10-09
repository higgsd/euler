-- 7295372
mm = 12000
nn1 = 1
dd1 = 3
nn2 = 1
dd2 = 2

-- count proper fractions in the (range] for the given denominator
countFrac n1 d1 n2 d2 d = length $ filter isProper [x1..x2]
    where isProper x = gcd d x == 1
          x1 = (d*n1) `div` d1 + 1
          x2 = (d*n2) `div` d2

-- count proper fractions in the (range], minus one to produce (range)
countFracs n1 d1 n2 d2 m = (sum $ map (countFrac n1 d1 n2 d2) [2..m]) - 1

main = putStrLn $ show $ countFracs nn1 dd1 nn2 dd2 mm
