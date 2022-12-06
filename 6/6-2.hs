import Data.List.Split ( splitOn )
import Data.List (nub)

solve :: [Int] -> String -> Int
solve (x:xs) s  = if t == 14 then x else solve xs (tail s)
    where t = length . nub . take 14 $ s

main :: IO ()
main = do
    contents <- readFile "6.in"
    print . solve [14..]  $ contents