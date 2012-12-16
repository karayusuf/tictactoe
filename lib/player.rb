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
      space = win
      space ||= block
      space
    end

    def win
      @board.winning_space_for @player
    end

    def block
      @board.winning_space_for opponent
    end

  end
end
