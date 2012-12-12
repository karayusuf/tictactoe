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
      completes_row_for?(player) ||
        completes_column_for?(player) ||
          completes_diagonal_up_for?(player) ||
            completes_diagonal_down_for?(player)
    end

    def row_neighbors
      @board.find_spaces_excluding(self) do |space|
        space.row == row
      end
    end

    def column_neighbors
      @board.find_spaces_excluding(self) do |space|
        space.column == column
      end
    end

    def diagonal_up_neighbors
      @board.find_spaces_excluding(self) do |space|
        (space.row + space.column) == 2
      end
    end

    def diagonal_down_neighbors
      @board.find_spaces_excluding(self) do |space|
        space.row == space.column
      end
    end

    private

    def completes_row_for? player
      open? && row_neighbors.all? { |space| space.marked_by? player }
    end

    def completes_column_for? player
      open? && column_neighbors.all? { |space| space.marked_by? player }
    end

    def completes_diagonal_up_for? player
      open? && diagonal_up_neighbors.all? { |space| space.marked_by? player }
    end

    def completes_diagonal_down_for? player
      open? && diagonal_down_neighbors.all? { |space| space.marked_by? player }
    end
  end
end
