module Handler.Move where

import Import
import Yesod.Json
import Data.Text hiding (zip, foldr, head, map, unwords)
import GameState
import Token
import Board

getMoveR :: Handler RepJson
getMoveR = do
  board <- lookupGetParam boardParam
  jsonToRepJson $ jsonMap [("newBoard", newBoard board)]
  where newBoard board = case board of
                           Nothing      -> jsonList ["Nothing"]
                           Just message -> jsonList . map jsonScalar . map show $ makeMove message

queryCharToToken 'e' = Empty
queryCharToToken 'x' = X
queryCharToToken 'o' = O

createGameState = GameState O . Board . map queryCharToToken

makeMove text = tokens . board . bestMove . createGameState $ unpack text

boardParam :: Text
boardParam = pack "board"

moveParam :: Text
moveParam = pack "move"
