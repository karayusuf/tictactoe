require File.dirname(__FILE__) + '/space'
require File.dirname(__FILE__) + '/fork_space'
require File.dirname(__FILE__) + '/winning_space'

module TicTacToe
  class Board
    attr_reader :spaces

    def self.new_with_board(board)
      spaces = board.spaces.map(&:value)
      new(spaces)
    end

    def initialize(spaces)
      @spaces = identify_spaces(spaces)
    end

    def open_spaces
      @spaces.select { |space| space.open? }
    end

    def find_space(row, column)
      @spaces.detect do |space|
        space.row_and_column == "#{row} #{column}"
      end
    end

    def find_spaces_excluding(exclusion)
      @spaces.select do |space|
        next if space.index == exclusion.index
        yield space
      end
    end

    def has_two_winning_spaces_for? player
      winning_spaces = WinningSpace.find_all(player, self)
      winning_spaces.count == 2
    end

    private

    def identify_spaces(spaces)
      spaces = spaces.flatten.each_with_index
      spaces.map do |value, index|
        Space.new(value, index, self)
      end
    end
  end
end
