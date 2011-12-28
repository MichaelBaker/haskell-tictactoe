#h1 What this is
It's a Tic Tac Toe game written in Haskell.

#h1 How to play on OSX
I've included a binary compiled for OSX.
On the command line, cd into the project's root directory and run './dist/build/WebInterface/WebInterface'
Then navigate to localhost:3000 in your browser to play the game.

#h1 How to play otherwise
First, you'll need to install Haskell and the Haskell Platform: [http://hackage.haskell.org/platform/](http://hackage.haskell.org/platform/)
On the command line, navigate to the project's root directory and run 'cabal update'
Then run 'cabal install'
Then run 'yesod devel'
Then navigate to localhost:3000 in your browser to play the game.

#h1 Where the AI's code is
It's in the 'src' directory.
