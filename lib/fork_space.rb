require File.dirname(__FILE__) + '/board'

module TicTacToe
  class ForkSpace

    def self.find player, board
      new(player, board).find_fork
    end

    def initialize player, board
      @player = player
      @board  = board
    end

    def find_fork
      @board.open_spaces.detect do |space|
        board = Board.new_with_board @board
        board.find_space(space.row, space.column).mark @player
        board.has_two_winning_spaces_for? @player
      end
    end

  end
end
