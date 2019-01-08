import Data.Char as C

main = do
  putStrLn "hello, what's your message?"
  message <- getLine
  putStrLn(scrabbleize message)

scrabbleize :: [Char] -> String
scrabbleize = concatMap format

format :: Char -> String
format x = if (canBeEmoji x) then (emojify x)
           else [x]

canBeEmoji :: Char -> Bool
canBeEmoji '!' = True
canBeEmoji '?' = True
canBeEmoji x = isScrabble x || C.isNumber x

isScrabble :: Char -> Bool
isScrabble ' ' = True
isScrabble c = C.isAlpha c

toScrabble :: Char -> Char
toScrabble ' ' = '_'
toScrabble c = c

emojify :: Char -> String
emojify x = if (isScrabble x) then (":sc" ++ [toScrabble x] ++ ":")
            else (":" ++ spell x ++ ":")

spell :: Char -> String
spell '0' = "zero"
spell '1' = "one"
spell '2' = "two"
spell '3' = "three"
spell '4' = "four"
spell '5' = "five"
spell '6' = "six"
spell '7' = "seven"
spell '8' = "eight"
spell '9' = "nine"
spell '!' = "exclamation"
spell '?' = "question"
spell  _  = ""
