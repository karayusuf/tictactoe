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

    def marked_by? player
      @value == player
    end

    def winning_space_for? player
      open? && row_neighbors.all? { |space| space.marked_by? player }
    end

    def row_neighbors
      @board.spaces.select do |space|
        space.row == row &&
        space.column != column
      end
    end
  end
end
