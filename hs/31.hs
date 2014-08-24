-- 73682

coinCombs n = length [ 1 | a <- [n,n-200..0],
                           b <- [a,a-100..0],
                           c <- [b,b-50..0],
                           d <- [c,c-20..0],
                           e <- [d,d-10..0],
                           f <- [e,e-5..0],
                           _ <- [f,f-2..0] ]

main = putStrLn $ show $ coinCombs 200
