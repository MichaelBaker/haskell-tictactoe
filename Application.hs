{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application
    ( withTicTacToe
    , withDevelAppPort
    ) where

import Import
import Settings
import Yesod.Static
import Yesod.Default.Config
import Yesod.Default.Main (defaultDevelApp, defaultRunner)
import Yesod.Default.Handlers (getFaviconR, getRobotsR)
import Yesod.Logger (Logger)
import Network.Wai (Application)
import Data.Dynamic (Dynamic, toDyn)

-- Import all relevant handler modules here.
import Handler.Root
import Handler.Move

-- This line actually creates our YesodSite instance. It is the second half
-- of the call to mkYesodData which occurs in Foundation.hs. Please see
-- the comments there for more details.
mkYesodDispatch "TicTacToe" resourcesTicTacToe

-- This function allocates resources (such as a database connection pool),
-- performs initialization and creates a WAI application. This is also the
-- place to put your migrate statements to have automatic database
-- migrations handled by Yesod.
withTicTacToe :: AppConfig DefaultEnv -> Logger -> (Application -> IO ()) -> IO ()
withTicTacToe conf logger f = do
#ifdef PRODUCTION
    s <- static Settings.staticDir
#else
    s <- staticDevel Settings.staticDir
#endif
    let h = TicTacToe conf logger s
    defaultRunner f h

-- for yesod devel
withDevelAppPort :: Dynamic
withDevelAppPort = toDyn $ defaultDevelApp withTicTacToe
