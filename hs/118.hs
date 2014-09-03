-- 44680
import Data.List(permutations)
import Euler(isPrimeSimple)

genSets0 [] _ = [[]]
genSets0 xs ps = [y:ns | n <- [length ps..length xs],
                         let (ys,zs) = splitAt n xs,
                         n /= length ps || ys > ps,
                         let y = buildNum ys,
                         isPrimeSimple y,
                         ns <- genSets0 zs ys]
    where buildNum ys = sum $ zipWith (*) (reverse ys) (iterate (10*) 1)
genSets xs = genSets0 xs [0]

main = putStrLn $ show $ length $ concatMap genSets $ permutations [1..9]
