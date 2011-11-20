module Handler.Move where

import Import
import Yesod.Json

getMoveR :: String -> Handler RepJson
getMoveR message = do
  jsonToRepJson $ jsonMap [("message", jsonScalar $ message ++ " in bed")]
