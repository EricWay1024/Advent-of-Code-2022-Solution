import Data.List.Split

convert :: String -> Int
convert "A" = 0
convert "X" = 0
convert "B" = 1
convert "Y" = 1
convert "C" = 2
convert "Z" = 2

result :: [Int] -> Int
result (x : y : _)
  | x == y                  = 3 + y + 1
  | y == (x + 1) `mod` 3    = 6 + y + 1
  | otherwise               = y + 1

main :: IO ()
main = do  
    contents <- readFile "2.in"
    print . sum . map (result . map convert . splitOn " ") . splitOn "\n" $ contents