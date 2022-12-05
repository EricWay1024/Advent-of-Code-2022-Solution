
import Data.Array
import Data.Char (isDigit)
import Data.List.Split

readInt :: String -> Int
readInt = read

processStr :: String -> String
processStr s = [x | (x, _) <- filter (\ (_, y) -> y `mod` 4 == 1) t]
    where t = zip s [0..]

parseStr :: String -> [String -> String]
parseStr s = [if c == ' ' then id else (c:) | c <- s]

makeStacks :: [String] -> [String] -> [String]
makeStacks = foldl (\ acc s -> [g t | (g, t) <- zip (parseStr s) acc])

makeCommands :: [[Int]] -> [(Int, Int)]
makeCommands [] = []
makeCommands ([1, y, z]:xs) = (y, z): makeCommands xs
makeCommands ([x, y, z]:xs) = (y, z): makeCommands ([x - 1, y, z]:xs)

applyCommand :: Array Int String -> (Int, Int) -> Array Int String
applyCommand a (x, y)  = a // [(x, t), (y, s:(a!y))]
    where (s:t) = a!x

main :: IO ()
main = do
    contents <- readFile "5.in"
    let contentLines = lines contents
        stackLines = map processStr . reverse . take 8 $ contentLines
        cmdLines = makeCommands . map (map readInt . splitOn "  " . tail . filter (\c -> isDigit c || c == ' ')) . drop 10 $ contentLines
        stacks = array (1, 9) (zip [1..] (makeStacks ["" | _ <- [1..9]] stackLines))
        res = map head . elems $ foldl applyCommand stacks cmdLines
    print res