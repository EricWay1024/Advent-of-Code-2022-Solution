import Data.List.Split

readInt :: String -> Int
readInt = read

strToPair :: String -> (Int, Int)
strToPair s = (readInt s1, readInt s2)
    where (s1:s2:_) = splitOn "-" s

isContain :: [(Int, Int)] -> Bool
isContain ((x, y):(a, b):_) = (x <= a && b <= y) || (a <= x && y <= b)

main :: IO ()
main = do
    contents <- readFile "4.in"
    print . length . filter isContain . map (map strToPair . splitOn  ",") . lines $ contents