import Data.Char(isDigit)
import Data.List (isPrefixOf)

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

getFirstandLastDigits :: String -> [Int]
getFirstandLastDigits str = [head digits, last digits]
  where digits = map (read . (:[])) $ filter isDigit str


repl :: String -> String
repl "" = ""
repl str = case str of
    _ | "one" `isPrefixOf` str -> '1' : repl (drop 3 str)
    _ | "two" `isPrefixOf` str -> '2' : repl (drop 3 str)
    _ | "three" `isPrefixOf` str -> '3' : repl (drop 5 str)
    _ | "four" `isPrefixOf` str -> '4' : repl (drop 4 str)
    _ | "five" `isPrefixOf` str -> '5' : repl (drop 4 str)
    _ | "six" `isPrefixOf` str -> '6' : repl (drop 3 str)
    _ | "seven" `isPrefixOf` str -> '7' : repl (drop 5 str)
    _ | "eight" `isPrefixOf` str -> '8' : repl (drop 5 str)
    _ | "nine" `isPrefixOf` str -> '9' : repl (drop 4 str)
    _ -> head str : repl (tail str)

getCalibrationSumPart1 :: [String] -> Int
getCalibrationSumPart1 = sum . map (read . concatMap show . getFirstandLastDigits)

getCalibrationSumPart2 :: [String] -> Int
getCalibrationSumPart2 = sum . map (read . concatMap show . getFirstandLastDigits . repl)

-- Part 2 not fully working
main :: IO()
main = do
    input <- readLines "Advent of code/Input/day1Input.txt"
    print $ getCalibrationSumPart1 input
    print $ getCalibrationSumPart2 input
    print $ repl "14nsnlqqlgfourxbzzxfztvbxsnxttjmktcxkkkzfphppsczqoneightgc"
