module Handler.Move where

import Import
import Yesod.Json
import Data.Text hiding (zip, foldr, head, map, unwords, concat)
import GameState
import Token
import Board

getMoveR :: Handler RepJson
getMoveR = do
  board <- lookupGetParam boardParam
  case respondTo board of
    Nothing            -> invalidArgs []
    (Just jsonReponse) -> jsonReponse

respondTo Nothing = Nothing
respondTo (Just encodedBoard) =
  Just $ jsonToRepJson (jsonMap [("newBoard", responseBoard),
                                 ("winState", winState newGameState)])
  where newGameState  = makeMove encodedBoard
        responseBoard = jsonList $ map (jsonScalar . show) (tokens $ board newGameState)

winState gameState
  | xWins initialBoard = jsonScalar "x wins"
  | oWins initialBoard = jsonScalar "o wins"
  | tie   initialBoard = jsonScalar "tie"
  | otherwise          = jsonScalar "in progress"
  where initialBoard = board gameState

unpackBoard = createGameState . unpack

createGameState = GameState O . Board . map queryCharToToken

queryCharToToken 'e' = Empty
queryCharToToken 'x' = X
queryCharToToken 'o' = O

makeMove text
  | xWins initialBoard = gameState
  | oWins initialBoard = gameState
  | tie   initialBoard = gameState
  | otherwise          = bestMove gameState
  where gameState    = unpackBoard text
        initialBoard = board gameState

boardParam :: Text
boardParam = pack "board"
