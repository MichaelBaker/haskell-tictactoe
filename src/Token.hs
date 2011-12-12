module Token where

import Prelude

data Token = X | O | Empty deriving (Eq)

instance Show Token where
  show X     = "X"
  show O     = "O"
  show Empty = "_"

tokenValue X     = 1
tokenValue Empty = 0
tokenValue O     = (-1)
