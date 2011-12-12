{-# LANGUAGE NoMonomorphismRestriction #-}

module Minimax(maximize, minimize) where

import Tree
import Valuable
import Prelude

maximize node = maxNode node Min Max
minimize node = minNode node Min Max

minNode node alpha beta = traverse expandMinNode beta node alpha beta
maxNode node alpha beta = traverse expandMaxNode alpha node alpha beta

expandMinNode = expandNode (<) maxNode
expandMaxNode = expandNode (>) minNode

traverse expand startValue node alpha beta
  | isLeaf node = value node
  | otherwise   = fst $ foldr (expand alpha beta) (startValue, firstChild) nodeChildren
  where nodeChildren = children node
        firstChild   = head nodeChildren

expandNode test traverse alpha beta child best@(oldValue, _) =
  if alpha >= beta
    then best
    else let newValue = traverse child alpha beta
             in if test newValue oldValue
                  then (newValue, child)
                  else best
