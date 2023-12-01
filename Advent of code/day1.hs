import Data.Char(isDigit)

readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

getFirstandLastDigits :: String -> [Int]
getFirstandLastDigits str = [head digits, last digits]
  where digits = map (read . (:[])) $ filter isDigit str

getCalibrationSum :: [String] -> Int
getCalibrationSum = sum . map (read . concatMap show . getFirstandLastDigits)

main :: IO()
main = do 
    input <- readLines "Advent of code/Input/day1Input.txt" 
    print $ getCalibrationSum input