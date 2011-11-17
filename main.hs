import Yesod.Default.Config (fromArgs)
import Yesod.Default.Main   (defaultMain)
import Application          (withTicTacToe)
import Prelude              (IO)

main :: IO ()
main = defaultMain fromArgs withTicTacToe