module Tree where

import Prelude

class Tree a where
  children :: a -> [a]
  isLeaf   :: a -> Bool
  isLeaf = null . children
