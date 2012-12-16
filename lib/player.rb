require File.dirname(__FILE__) + '/board'
require File.dirname(__FILE__) + '/winning_move'

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
      WinningMove.find @player, @board
    end

    def block
      WinningMove.find opponent, @board
    end

  end
end
