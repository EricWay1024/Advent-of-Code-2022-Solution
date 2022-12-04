import Data.List.Split

readInt :: String -> Int
readInt = read

strToPair :: String -> (Int, Int)
strToPair s = (readInt s1, readInt s2)
    where (s1:s2:_) = splitOn "-" s

isOverlap :: [(Int, Int)] -> Bool
isOverlap ((x, y):(a, b):_) = not ((y < a) || (x > b))

main :: IO ()
main = do
    contents <- readFile "4.in"
    print . length . filter isOverlap . map (map strToPair . splitOn  ",") . lines $ contents