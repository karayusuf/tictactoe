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

    def mark player
      @value = player
    end

    def marked_by? player
      @value == player
    end

    def winning_space_for? player
      completes_row_for?(player) ||
        completes_column_for?(player) ||
          completes_forward_slash_for?(player) ||
            completes_back_slash_for?(player)
    end

    def spaces_in_row
      @board.find_spaces_excluding(self) do |space|
        space.row == row
      end
    end

    def spaces_in_column
      @board.find_spaces_excluding(self) do |space|
        space.column == column
      end
    end

    def spaces_in_forward_slash
      @board.find_spaces_excluding(self) do |space|
        (space.row + space.column) == 2
      end
    end

    def spaces_in_back_slash
      @board.find_spaces_excluding(self) do |space|
        space.row == space.column
      end
    end

    private

    def completes_row_for? player
      open? && spaces_in_row.all? { |space| space.marked_by? player }
    end

    def completes_column_for? player
      open? && spaces_in_column.all? { |space| space.marked_by? player }
    end

    def completes_forward_slash_for? player
      open? && spaces_in_forward_slash.all? { |space| space.marked_by? player }
    end

    def completes_back_slash_for? player
      open? && spaces_in_back_slash.all? { |space| space.marked_by? player }
    end
  end
end
