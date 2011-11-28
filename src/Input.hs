module Input where

import Board
import System.IO

getMove board = do
  putStr "Please enter move: " >> hFlush stdout
  input <- getLine
  case (getColumn input, getRow input) of
    (Just a, Just b) -> if isEmpty board (indexFromTuple (a, b))
                          then return (a, b)
                          else getMove board
    otherwise        -> getMove board


getColumn = matchLetter (zip "abc" [0..2])
getRow    = matchLetter (zip "123" [0..2])

matchLetter :: [(Char, Int)] -> String -> Maybe Int
matchLetter _ []           = Nothing
matchLetter mapping (s:ss) = case lookup s mapping of
                               Just x    -> Just x
                               otherwise -> matchLetter mapping ss

