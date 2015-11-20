import System.Environment
import Data.Char

digits :: Int -> [Int]
digits = (map digitToInt) . show

sq :: Int -> Int
sq = flip (^) $ 2

sqDigits x = map sq $ digits x

step x = foldl (+) 0 $ sqDigits x

happy :: [Int] -> Int -> (String, Int)
happy _ 1 = "happy"
happy xs x
  | x `elem` xs = "Cycle at " ++ show x
  | otherwise = happy (x:xs) (step x) 

main :: IO ()
main = do arg <- getArgs
          let count = read $ arg !! 0
           in print $ last (map (happy []) [1..count])