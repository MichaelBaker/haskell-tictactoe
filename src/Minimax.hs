{-# LANGUAGE NoMonomorphismRestriction #-}

module Minimax(maximize, minimize) where

import Tree
import Valuable
import Prelude

maximize node
  | isLeaf node = value node
  | otherwise   = maximum . map minimize $ children node

minimize node
  | isLeaf node = value node
  | otherwise   = minimum . map maximize $ children node
