import Data.List.Split
import Data.List

readInt :: String -> Int
readInt = read

parse :: String -> [Int]
parse = map (sum . (map readInt . words)) . splitOn "\n\n"

main :: IO ()
main = do
    contents <- readFile "1.in"
    print . maximum . parse $ contents