module GameState (bestMove, GameState(GameState, token, board)) where

import Tree
import Board
import Token
import Minimax
import Data.Foldable
import Valuable
import Prelude

bestMove s@(GameState X _) = findMove s findMax minimize
bestMove s@(GameState O _) = findMove s findMin maximize

data GameState = GameState { token :: Token, board :: Board } deriving (Eq)

instance Valuable GameState where
  value (GameState _ board) = boardValue board

instance Show GameState where
  show (GameState _ board) = show board

instance Tree GameState where
  isLeaf   (GameState token board) = xWins board || oWins board || tie board
  children (GameState X     board) = map (GameState O) (movesFor board X)
  children (GameState O     board) = map (GameState X) (movesFor board O)

instance Ord GameState where
  compare (GameState _ a) (GameState _ b) = compare a b

findMove state comparison strategy = fst $ foldl' comparison (head pairs) pairs
                                     where moves  = children state
                                           values = map strategy moves
                                           pairs  = zip moves values

findMax = compareBoards xWins
findMin = compareBoards oWins

compareBoards shortCircuit a@(s, x) b@(_, y)
  | shortCircuit newBoard = a
  | x < y                 = a
  | otherwise             = b
  where newBoard = board s
