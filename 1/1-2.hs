import Data.List.Split
import Data.List

readInt :: String -> Int
readInt = read

sumFirstThree :: [Int] -> Int
sumFirstThree (x:y:z:xs) = x + y + z

parse :: String -> [Int]
parse = map (sum . (map readInt . words)) . splitOn "\n\n"

main :: IO ()
main = do
    contents <- readFile "1.in"
    print . sumFirstThree . reverse . sort . parse $ contents