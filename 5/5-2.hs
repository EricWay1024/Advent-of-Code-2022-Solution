
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

applyCommand :: Array Int String -> [Int] -> Array Int String
applyCommand a [x, y, z]  = a // [(y, t), (z, s ++ (a!z))]
    where s = take x (a!y)
          t = drop x (a!y)

main :: IO ()
main = do
    contents <- readFile "5.in"
    let contentLines = lines contents
        stackLines = map processStr . reverse . take 8 $ contentLines
        cmdLines = map (map readInt . splitOn "  " . tail . filter (\c -> isDigit c || c == ' ')). drop 10 $ contentLines
        stacks = array (1, 9) (zip [1..] (makeStacks ["" | _ <- [1..9]] stackLines))
        res = map head . elems $ foldl applyCommand stacks cmdLines
    print res