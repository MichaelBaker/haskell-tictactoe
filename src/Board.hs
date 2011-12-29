module Board (emptyBoard,
              boardValue,
              xWins,
              oWins,
              tie,
              isEmpty,
              movesFor,
              placeToken,
              indexFromTuple,
              tokens,
              Board(Board)) where

import Token
import Tree
import Valuable
import Prelude

emptyBoard = Board [Empty | x <- [0..8]]

boardValue board | xWins board = Max
                 | oWins board = Min
                 | otherwise   = foldr addValues (Value 0) (lineValues board)

xWins board = any (== Max) (lineValues board)
oWins board = any (== Min) (lineValues board)
tie   board = all (not . isEmpty board) [0..8]

isEmpty (Board a) index = (a !! index) == Empty

movesFor board token = map (placeTokenAtIndex board token) validIndicies
                       where validIndicies = filter (isEmpty board) [0..8]

placeToken board t token = placeTokenAtIndex board token (indexFromTuple t)

indexFromTuple (column, row) = row * 3 + column

tokens (Board list) = list

data Board = Board [Token] deriving (Eq)

instance Ord Board where
  compare a b = compare (boardValue a) (boardValue b)

instance Show Board where
  show board = " (a,b,c)\n" ++
               "1" ++ (show $ row 0 board) ++ "\n" ++
               "2" ++ (show $ row 1 board) ++ "\n" ++
               "3" ++ (show $ row 2 board) ++ "\n"

addValues (Value a) (Value b) = Value (a + b)

lineValue (X, X, X) = Max
lineValue (O, O, O) = Min
lineValue (a, b, c) = Value (tokenValue a + tokenValue b + tokenValue c)

lineValues board = map lineValue (boardLines board)

boardLines board = [row 0 board,
                    row 1 board,
                    row 2 board,
                    column 0 board,
                    column 1 board,
                    column 2 board,
                    diagonalRight board,
                    diagonalLeft board]

token (Board a) t = a !! (indexFromTuple t)

row    x board = (token board (0, x), token board (1, x), token board (2, x))
column x board = (token board (x, 0), token board (x, 1), token board (x, 2))

diagonalRight board = (token board (0, 0), token board (1, 1), token board (2, 2))
diagonalLeft  board = (token board (2, 0), token board (1, 1), token board (0, 2))

placeTokenAtIndex (Board a) token index = Board $ concat [startingSpaces, [token], endingSpaces]
                                          where startingSpaces = take index a
                                                endingSpaces   = drop (index + 1) a

