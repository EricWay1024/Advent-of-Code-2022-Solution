import Data.List.Split ( splitOn )

parse :: String -> (Int, Int)
parse "noop" = (1, 0)
parse s = (2, read . drop 5 $ s)

getScore :: [(Int, Int)] -> Int -> Int
getScore s t = t * v
    where (u, v) = last (filter (\(x, y) -> x < t) s)

main :: IO ()
main = do
    contents <- readFile "10.in"
    let cmds = map parse . lines $ contents
        states = (0, 1) : [(c1 + s1, c2 + s2) | ((c1, c2), (s1, s2)) <- zip cmds states]
    print states
    print . sum . map (getScore states) $ [20, 60, 100, 140, 180, 220]