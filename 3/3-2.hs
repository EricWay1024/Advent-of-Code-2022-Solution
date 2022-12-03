import Data.List.Split
import Data.List
import Data.Char
import Data.List.Ordered

priority :: Char -> Int
priority c
    | isAsciiLower c = ord c - ord 'a' + 1
    | isAsciiUpper c = ord c - ord 'A' + 27

findCommon :: String -> String -> String -> Char 
findCommon (x:xs) ys zs = if member x ys && member x zs then x else findCommon xs ys zs

calculate :: [String] -> Int 
calculate [] = 0
calculate (x:y:z:xs) = priority (findCommon x y z) + calculate xs

main = do
    contents <- readFile "3.in"
    print . calculate . map sort . splitOn "\n" $ contents