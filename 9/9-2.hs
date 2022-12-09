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

makeCoords :: [(Int, Int)] -> [String] -> [(Int, Int)]
makeCoords ys [] = ys
makeCoords (y:ys) (x:xs) = makeCoords (move x y:y:ys) xs

splitMoves :: [(String, Int)] -> [String]
splitMoves [] = []
splitMoves ((s, 1):sx) = s:splitMoves sx
splitMoves ((s, a):sx) = s:splitMoves ((s, a - 1):sx)

findNthTail :: Int -> [(Int, Int)] -> [(Int, Int)]
findNthTail 0 hcs = hcs
findNthTail n hcs = findNthTail (n - 1) tcs
    where tcs = (0, 0) : [moveTail hc tc | (hc, tc) <- zip (tail hcs) tcs]

main :: IO ()
main = do
    contents <- readFile "9.in"
    let headCoords = reverse . makeCoords [(0, 0)] . splitMoves .  map ((\ [x, y] -> (x, readInt y)) . splitOn " ") . lines $ contents
        tailCoords = findNthTail 9 headCoords
    print . length . nub $ tailCoords