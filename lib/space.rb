require File.dirname(__FILE__) + '/board'

module TicTacToe
  class Space
    attr_reader :value, :index, :board

    def initialize(value, index, board)
      @value = value
      @index = index
      @board = board
    end

    def row
      @index / 3
    end

    def column
      @index % 3
    end

    def row_and_column
      "#{row} #{column}"
    end

    def open?
      @value == "_"
    end

    def winning_space_for?(player, board)
      open? &&
      row_neighbors(board).map(&:value) == ([player] * 2)
    end

    def row_neighbors(board)
      board.spaces.select do |space|
        space.row == row &&
        space.column != column
      end
    end
  end
end
