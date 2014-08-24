-- 14234
import Data.List(sort)

nn = 50
origin = (0,0)

genPoints n = [(p,q) |
               x1 <- [0..n], y1 <- [0..n], let p = (x1,y1), p /= origin,
               x2 <- [0..n], y2 <- [0..n], let q = (x2,y2), q /= origin, q > p]

distSq3 (p,q) = triple $ sort [distSq origin p, distSq origin q, distSq p q]
    where distSq (x1,y1) (x2,y2) = (abs $ x1 - x2) ^ 2 + (abs $ y1 - y2) ^ 2
          triple [] = error "triple: empty"
          triple [_] = error "triple: single"
          triple [_,_] = error "triple: double"
          triple (x:y:z:_) = (x,y,z)

getRightTris n = [pq | pq <- genPoints n, let (a,b,c) = distSq3 pq, a + b == c]

main = putStrLn $ show $ length $ getRightTris nn
