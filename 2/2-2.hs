import Data.List.Split

convert :: String -> Int
convert "A" = 0
convert "X" = 2
convert "B" = 1
convert "Y" = 0
convert "C" = 2
convert "Z" = 1

result :: [Int] -> Int
result (x : z : _)
  | x == y                  = 3 + y + 1
  | y == (x + 1) `mod` 3    = 6 + y + 1
  | otherwise               = y + 1
  where y = (x + z) `mod` 3

main :: IO ()
main = do  
    contents <- readFile "2.in"
    print . sum . map (result . map convert . splitOn " ") . splitOn "\n" $ contents