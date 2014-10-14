-- 101524
import Data.List(genericLength, group, partition, sort, transpose)

-- XXX community chest and chance are only shuffled once, not a random draw
-- XXX current markov state can't handle that accurately

nn = 3
dd = 4  -- XXX figure out why this doesn't give the right result for 6

-- matrix converges to correct answer after 20 iterations
ii = 50

-- square names
squareNames = ["GO", "A1", "CC1", "A2", "T1",
               "R1", "B1", "CH1", "B2", "B3",
               "JAIL", "C1", "U1", "C2", "C3",
               "R2", "D1", "CC2", "D2", "D3",
               "FP", "E1", "CH2", "E2", "E3",
               "R3", "F1", "F2", "U2", "F3",
               "G2J", "G1", "G2", "CC3", "G3",
               "R4", "CH3", "H1", "T2", "H2"]
nameToSquare n = case lookup n $ zip squareNames [0..] of
    Nothing -> error "nameToSquare: invalid name"
    Just i -> i

-- given a starting square, distance to advance,
-- whether it was doubles, and probability
-- return a list of visited squares, their probabilities,
-- and whether the visited square the last
advance s ((r,d),p)
    | s2 == nameToSquare "G2J" = [((jail, p), True)]
    | s2 `elem` (map nameToSquare ["CC1","CC2","CC3"]) = chest
    | s2 `elem` [ch1,ch2,ch3] = chance
    | otherwise = [((s2, p), d)]
    where s2 = (s + r) `mod` length squareNames
          chest = [((go, p/16), d),
                   ((jail, p/16), True),
                   ((s2, 14*p/16), d)]
          chance = [((go, p/16), d),
                    ((jail, p/16), True),
                    ((nameToSquare "C1", p/16), d),
                    ((nameToSquare "E3", p/16), d),
                    ((nameToSquare "H2", p/16), d),
                    ((r1, p/16), d),
                    ((nextRailroad, 2*p/16), d),
                    ((nextUtility, p/16), d),
                    ((s2-3, p/16), d), -- cannot wrap
                    ((s2, 6*p/16), d)]
          nextRailroad = if s2 == ch1 then nameToSquare "R2" else
                         if s2 == ch2 then nameToSquare "R3" else r1
          nextUtility = if s2 == ch1 || s2 == ch3 then
                        nameToSquare "U1" else nameToSquare "U2"
          [jail,go,ch1,ch2,ch3,r1] = map nameToSquare
                                     ["JAIL","GO","CH1","CH2","CH3","R1"]

-- given two dice with n sides
-- return a list of ((distance, is doubles), probability)
rollProbs n p = map listToProb $ group $ sort ds
    where ds = [(a+b, a==b) | a <- [1..n], b <- [1..n]]
          listToProb xs = (head xs, p * genericLength xs / genericLength ds)

-- simulate a single turn from the given starting square
-- produce a non-unique list of (ending square, probability) values
oneRoll n (s,p) = (map fst d, map fst m)
    where (d,m) = partition snd $ concatMap (advance s) (rollProbs n p)
manyRolls n xs = (concat d, concat m)
    where (d,m) = unzip $ map (oneRoll n) xs
oneTurn n s = m1 ++ m2 ++ m3 ++ mj
    where (d1,m1) = manyRolls n [(s,1)]
          (d2,m2) = manyRolls n d1
          (js,m3) = manyRolls n d2
          mj = [(nameToSquare "JAIL", sum $ map snd js)]
probsForSquare d s = map getProb [0..length squareNames - 1]
    where getProb x = sum $ map snd $ filter (\(v,_) -> x==v) $ oneTurn d s

-- build an initial markov state space, and run it for a number of iterations
-- XXX detect rather than presume convergence
runMarkov d t = iterate matrixMult m !! t
    where m = map (probsForSquare d) [0..length squareNames - 1]
          matrixMult a = [[sum $ zipWith (*) (m !! i) (transpose a !! j) |
                          j <- [0..length m-1]] | i <- [0..length m-1]]

-- sort the converged markov state space by square
-- extract the top n squares, and combine them into a single number
-- JAIL is 10 and always the most popular, so ignore zero-padding
popularSquares n d i = sum $ zipWith (*) (iterate (*100) 1) $
                       reverse $ take n $ reverse $ map snd $
                       sort $ zip (head $ runMarkov d i) [0..]

main = putStrLn $ show $ popularSquares nn dd ii
