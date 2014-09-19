-- 137846528820
import Euler(nChooseK)

nn = 20

-- two choices at each node, 2n nodes to traverse
latticePaths n = nChooseK (n*2) n

main = putStrLn $ show $ latticePaths nn
