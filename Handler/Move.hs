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
  jsonToRepJson $ jsonMap [("newBoard", newBoard board),
                           ("winState", winState board)]

newBoard board = case board of
  Nothing      -> jsonList ["Nothing"]
  Just message -> jsonList . map jsonScalar . map show $ makeMove message

winState Nothing = jsonScalar "Nothing"
winState (Just text)
  | xWins initialBoard = jsonScalar "x wins"
  | oWins initialBoard = jsonScalar "o wins"
  | tie   initialBoard = jsonScalar "tie"
  | otherwise          = jsonScalar "in progress"
  where initialBoard = board $ unpackBoard text

queryCharToToken 'e' = Empty
queryCharToToken 'x' = X
queryCharToToken 'o' = O

createGameState = GameState O . Board . map queryCharToToken

makeMove text
  | xWins initialBoard = tokens initialBoard
  | oWins initialBoard = tokens initialBoard
  | tie   initialBoard = tokens initialBoard
  | otherwise          = tokens . board . bestMove $ gameState
  where gameState    = unpackBoard text
        initialBoard = board gameState

unpackBoard = createGameState . unpack

boardParam :: Text
boardParam = pack "board"

moveParam :: Text
moveParam = pack "move"
