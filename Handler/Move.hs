module Handler.Move where

import Import
import Yesod.Json
import Data.Text hiding (zip, foldr, head, map)

getMoveR :: Handler RepJson
getMoveR = do
  board <- lookupGetParam boardParam
  move  <- lookupGetParam moveParam

  jsonToRepJson $ jsonMap [("newBoard", jsonList $ newBoard board)]

  where newBoard board = case board of
                           Nothing      -> [jsonScalar "Nothing"]
                           Just message -> map (jsonScalar . (:[])) $ foldr (\a b -> (head $ show $ snd a):(fst a):b ) "" result
                             where result = zip (unpack message) [0..8] :: [(Char, Integer)]

boardParam :: Text
boardParam = pack "board"

moveParam :: Text
moveParam = pack "move"
