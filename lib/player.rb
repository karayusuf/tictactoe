require File.dirname(__FILE__) + '/board'

module TicTacToe
  class Player
    def initialize(player, board)
      @player = player
      @board  = board
    end

  end
end
