# What this is
It's a web interface for a Tic Tac Toe game written in Haskell.

# How to play on OSX
I've included a binary compiled for OSX.  
On the command line, cd into the project's root directory  
Then run './dist/build/WebInterface/WebInterface'  
Then navigate to localhost:3000 in your web browser to play the game.

# How to play otherwise
First, you'll need to install Haskell and the Haskell Platform: [http://hackage.haskell.org/platform/](http://hackage.haskell.org/platform/)  
On the command line, navigate to the project's root directory  
Than run 'cabal update'  
Then run 'cabal install'  
Then run 'yesod devel'  
Then navigate to localhost:3000 in your web browser to play the game.

# Where the AI's code is
It's in the 'src' directory.

# Playing on the command line
I've included the original command line interface in case you're a typing sort of a person rather than a clicking sort.

## On OSX
I've included a binary compiled for OSX.  
On the command line, cd into the project's root directory  
Then run './dist/build/CommandLineInterface/TicTacToe'

## On other platforms
First, you'll need to install Haskell: [http://hackage.haskell.org/platform/](http://hackage.haskell.org/platform/)  
On the command line, navigate to the project's 'src' directory  
Then run 'ghc -static -O2 TicTacToe.hs'  
Then run './TicTacToe'
