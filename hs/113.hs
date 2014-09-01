-- 51161058134250
nn = 100

-- increasing/decreasing after digit x is related to (n-1) figurate numbers
-- where n is the number of digits in the number
-- sum over every digit, minus 9 which are both
-- sum over all numbers of digits
countNonBouncy n = sum [n1 + n2 | x <- [1..9],
                        let n1 = product [10-x..8-x+n],
                        let n2 = product [x+1..x+n-1]] `div` f - 9
    where f = product [1..n-1]

totalNonBouncy n = sum $ map countNonBouncy [1..n]

main = putStrLn $ show $ totalNonBouncy nn
