module Valuable where

import Prelude

data Value = Min | Value Integer | Max deriving (Show, Ord, Eq)

class Valuable a where
  value :: a -> Value
