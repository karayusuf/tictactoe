# Complete the function below to print 2 integers separated by a single space which will be your next move
def next_move(player,board)
  player = TicTacToe::Player.new(player, board)
  print player.move.row_and_column
end

#If player is X, I'm the first player.
#If player is O, I'm the second player.
player = gets.chomp

#Read the board now. The board is a 3x3 array filled with X, O or _.
board = Array.new(3) { gets.scan /\w/ }

next_move(player,board)
