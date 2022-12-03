import Data.List.Split
import Data.List
import Data.Char
import Data.List.Ordered

priority :: Char -> Int
priority c
    | isAsciiLower c = ord c - ord 'a' + 1
    | isAsciiUpper c = ord c - ord 'A' + 27

halfSplit :: String -> (String, String)
halfSplit s = splitAt (n `div` 2) s
    where n = length s

findCommon :: String -> String -> Char 
findCommon (x:xs) ys = if member x ys then x else findCommon xs ys

calculate :: String -> Int 
calculate s = priority (findCommon t1 t2)
    where   (t1, s2) = halfSplit s
            t2 = sort s2

main = do
    contents <- readFile "3.in"
    print . sum . map calculate . splitOn "\n" $ contents