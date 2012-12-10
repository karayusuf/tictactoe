require File.dirname(__FILE__) + '/board'

module TicTacToe
  class Player
    def initialize(player, board)
      @player = player
      @board  = Board.new(board)
    end

    def opponent
      @player == "X" ? "O" : "X"
    end

    def move
      @board.winning_space_for(@player)
    end

  end
end
