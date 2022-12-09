import Data.List.Split ( splitOn )
import Data.List (nub)

readInt :: String -> Int
readInt = read 

move1D :: Int -> Int -> Int
move1D x1 x2    | x1 > x2   = x2 + 1
                | x1 < x2   = x2 - 1
                | otherwise = x2

moveTail :: (Int, Int) -> (Int, Int) -> (Int, Int)
moveTail (hx, hy) (tx, ty) | abs (hx - tx) <= 1 && abs (hy - ty) <= 1 = (tx, ty)
                           | otherwise = (move1D hx tx, move1D hy ty)

move :: String -> (Int, Int) -> (Int, Int)
move "R" (x, y) = (x + 1, y)
move "L" (x, y) = (x - 1, y)
move "U" (x, y) = (x, y + 1)
move "D" (x, y) = (x, y - 1)

makeMoves :: [(Int, Int)] -> [String] -> [(Int, Int)]
makeMoves ys [] = ys
makeMoves (y:ys) (x:xs) = makeMoves (move x y:y:ys) xs

splitMoves :: [(String, Int)] -> [String]
splitMoves [] = []
splitMoves ((s, 1):sx) = s:splitMoves sx
splitMoves ((s, a):sx) = s:splitMoves ((s, a - 1):sx)

main :: IO ()
main = do
    contents <- readFile "9.in"
    let headCoords = reverse . makeMoves [(0, 0)] . splitMoves .  map ((\ [x, y] -> (x, readInt y)) . splitOn " ") . lines $ contents
        tailCoords = (0, 0) : [moveTail hc tc | (hc, tc) <- zip (tail headCoords) tailCoords]
    print . length . nub $ tailCoords