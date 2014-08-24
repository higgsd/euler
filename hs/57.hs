-- 153
nn = 1000

nextExp ((n0,n1),(d0,d1)) = ((n1,n2),(d1,d2))
    where n2 = n0 + n1 * 2
          d2 = d0 + d1 * 2

genExp = build ((1,3),(1,2))
    where build xs = xs : (build $ nextExp xs)

biggerExp ((_,n),(_,d)) = ndigits n > ndigits d
    where ndigits x = length $ show x

main = putStrLn $ show $ length [() | x <- take nn genExp, biggerExp x]
