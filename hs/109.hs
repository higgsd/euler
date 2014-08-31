-- 38182
nn = 100

darts = (25,1) : (50,2) : concatMap (\d -> [(d,1), (d*2,2), (d*3,3)]) [1..20]

genScores = map throwScore $ genDarts 3 ++ genDarts 2 ++ genDarts 1
    where genDarts 1 = [[d] | d <- darts, snd d == 2]
          genDarts k = [d:ds | d <- darts, ds <- genDarts (k-1),
                               k == 2 || d >= head ds]
          throwScore ds = sum $ map fst ds

main = putStrLn $ show $ length $ filter (nn>) $ genScores
