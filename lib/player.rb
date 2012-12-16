require File.dirname(__FILE__) + '/board'
require File.dirname(__FILE__) + '/winning_space'
require File.dirname(__FILE__) + '/fork_space'

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
      space ||= create_fork
      space ||= block_fork
      space
    end

    def win
      WinningSpace.find @player, @board
    end

    def block
      WinningSpace.find opponent, @board
    end

    def create_fork
      ForkSpace.find @player, @board
    end

    def block_fork
      ForkSpace.block opponent, @board
    end

  end
end
