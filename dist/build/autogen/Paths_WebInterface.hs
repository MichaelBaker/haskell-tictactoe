module Paths_WebInterface (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,0,0], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/michaelbaker/Documents/Haskell/TicTacToe/WebInterface/cabal-dev//bin"
libdir     = "/Users/michaelbaker/Documents/Haskell/TicTacToe/WebInterface/cabal-dev//lib/WebInterface-0.0.0/ghc-7.0.3"
datadir    = "/Users/michaelbaker/Documents/Haskell/TicTacToe/WebInterface/cabal-dev//share/WebInterface-0.0.0"
libexecdir = "/Users/michaelbaker/Documents/Haskell/TicTacToe/WebInterface/cabal-dev//libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "WebInterface_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "WebInterface_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "WebInterface_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "WebInterface_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
