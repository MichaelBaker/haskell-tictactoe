import Input
import Minimax
import Token
import GameState
import Board

main = do
  putStrLn "Welcome to the gentleman's game of Tic Tac Toe"
  putStrLn "----------------------------------------------"
  gameLoop (GameState X emptyBoard) >>= putStrLn

gameLoop state@(GameState token currentBoard) | xWins currentBoard = do putStr (show currentBoard)
                                                                        return "~ X is the Winner! ~"
                                              | oWins currentBoard = do putStr (show currentBoard)
                                                                        return "~ O is the Winner! ~"
                                              | tie currentBoard   = do putStr (show currentBoard)
                                                                        return "~ Tie :^3 ~"
                                              | token == X  = do putStr (show currentBoard)
                                                                 move <- getMove currentBoard
                                                                 let newBoard = placeToken currentBoard move X
                                                                 gameLoop (GameState O newBoard)
                                              | token == O  = do putStr (show currentBoard)
                                                                 gameLoop $ GameState X newBoard
                                                                 where newBoard = board (bestMove state)

