-- 1582
nn = 200

-- lots of help from http://www.mathblog.dk/project-euler-122-efficient-exponentiation/

-- search all sub-paths recursively
genPath [] _ _ = error "genPath: empty"
genPath _ [] ds = ds
genPath xs ys ds = genPath xs (tail ys) ds2
    where z = head xs + head ys
          ds2 = genMult z xs ds

-- if path is an improvement, search it
genMult _ [] _ = error "genMult: empty"
genMult z xs ds
    | z > nn || d > ds !! z = ds
    | otherwise = genPath (z:xs) (z:xs) ds2
    where d = length xs
          (dsa,dsb) = splitAt z ds
          ds2 = dsa ++ [d] ++ tail dsb

-- generate all paths from seed
genMults = genPath xs xs (0:0:replicate (nn-1) nn)
    where xs = [1]

main = putStrLn $ show $ sum genMults
