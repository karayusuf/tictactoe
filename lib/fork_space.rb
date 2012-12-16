require File.dirname(__FILE__) + '/board'

module TicTacToe
  class ForkSpace

    def self.find player, board
      new(player, board).find_fork
    end

    def self.block player, board
      new(player, board).block_fork
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

    def block_fork
      return unless fork_space = find_fork

      if @board.has_multiple_corners_marked_by? @player
        @board.open_spaces.detect(&:edge?)
      else
        fork_space
      end
    end

  end
end
