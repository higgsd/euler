-- 73682
nn = 200
cc = [200,100,50,20,10,5,2]

coinCombs _ [] = 1
coinCombs n (c:cs) = sum [coinCombs (n-v) cs | v <- [0,c..n]]

main = putStrLn $ show $ coinCombs nn cc
