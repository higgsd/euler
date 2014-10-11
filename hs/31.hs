-- 73682
import Euler(countPartsRestricted)

nn = 200
cc = [1,2,5,10,20,50,100,200]

countChangeWays n c = countPartsRestricted c !! n

main = putStrLn $ show $ countChangeWays nn cc
