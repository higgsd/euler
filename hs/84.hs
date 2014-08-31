-- 101524
import Data.Function(on)
import Data.List(sortBy, groupBy)
import Data.Ratio((%))
import Text.Printf(printf)

squareNames = ["GO", "A1", "CC1", "A2", "T1",
               "R1", "B1", "CH1", "B2", "B3",
               "JAIL", "C1", "U1", "C2", "C3",
               "R2", "D1", "CC2", "D2", "D3",
               "FP", "E1", "CH2", "E2", "E3",
               "R3", "F1", "F2", "U2", "F3",
               "G2J", "G1", "G2", "CC3", "G3",
               "R4", "CH3", "H1", "T2", "H2"]

n2s n = case lookup n $ zip squareNames [0..] of
    Nothing -> error "n2s: invalid name"
    Just i -> i

goNextRailroad s
    | s > n2s "R1" && s <= n2s "R2" = n2s "R2"
    | s > n2s "R2" && s <= n2s "R3" = n2s "R3"
    | s > n2s "R3" && s <= n2s "R4" = n2s "R4"
    | otherwise = n2s "R1"

goNextUtility s
    | s > n2s "U1" && s <= n2s "U2" = n2s "U2"
    | otherwise = n2s "U1"

chest s p = [(n2s "GO", p * (1%16), False),
             (n2s "JAIL", p * (1%16), True),
             (s, p * (14%16), False)]

chance s p = [(n2s "GO", p * (1%16), False),
              (n2s "JAIL", p * (1%16), True),
              (n2s "C1", p * (1%16), False),
              (n2s "E3", p * (1%16), False),
              (n2s "H2", p * (1%16), False),
              (n2s "R1", p * (1%16), False),
              (goNextRailroad s, p * (2%16), False),
              (goNextUtility s, p * (1%16), False),
              (s, p * (6%16), False)] ++ advance s (-3) (p * (1%16))

advance s d p
    | s2 == n2s "CC1" = chest s2 p
    | s2 == n2s "CC2" = chest s2 p
    | s2 == n2s "CC3" = chest s2 p
    | s2 == n2s "CH1" = chance s2 p
    | s2 == n2s "CH2" = chance s2 p
    | s2 == n2s "CH3" = chance s2 p
    | s2 == n2s "G2J" = [(n2s "JAIL", p, True)]
    | otherwise = [(s2, p, False)]
    where s2 = (s + d) `mod` length squareNames

rollPair = [(2, 0, 1%16),
            (3, 2%16, 0),
            (4, 2%16, 1%16),
            (5, 4%16, 0),
            (6, 2%16, 1%16),
            (7, 2%16, 0),
            (8, 0, 1%16)]

nextSingle s p = concat [advance s d (p*p2) | (d,p2,_) <- rollPair, p2 /= 0]
nextDouble s p = concat [advance s d (p*p2) | (d,_,p2) <- rollPair, p2 /= 0]
nextMove s p = (stopDouble ++ nextSingle s p, againDouble)
    where stopDouble = filter (\(_,_,t) -> t) $ nextDouble s p
          againDouble = filter (\(_,_,t) -> not t) $ nextDouble s p

mergeMoveProbs xs = map addProbs $
                groupBy ((==) `on` fst3) $
                sortBy (compare `on` fst3) xs
    where fst3 (x,_,_) = x
          snd3 (_,x,_) = x
          addProbs [] = error "mergeMoveProbs: empty list"
          addProbs ((s,p,_):ys) = (s, p + (sum $ map snd3 ys))

performMove s p = mergeMoveProbs $ m1 ++ m2 ++ m3 ++ d3j
    where (m1,d1) = nextMove s p
          concatTuple (x,y) = (concat x, concat y)
          (m2,d2) = concatTuple $ unzip [nextMove s2 p2 | (s2,p2,_) <- d1]
          (m3,d3) = concatTuple $ unzip [nextMove s3 p3 | (s3,p3,_) <- d2]
          d3j = [(n2s "JAIL", p4, t) | (_,p4,t) <- d3]

mergeProbs xs = map addProbs $
                groupBy ((==) `on` fst) $
                sortBy (compare `on` fst) xs
    where addProbs [] = error "mergeProbs: empty list"
          addProbs ((s,p):ys) = (s, p + (sum $ map snd ys))

performMoves 1 = performMove 0 1
performMoves n = mergeProbs $ concat performNextMove
    where performNextMove = [performMove s p | (s,p) <- performMoves (n-1)]

topSquares = reverse $ sortBy (compare `on` snd) $ performMoves 10

main = do
    printf "%02d%02d%02d\n" (tops !! 0) (tops !! 1) (tops !! 2)
        where tops = map fst topSquares
