require File.dirname(__FILE__) + '/space'

module TicTacToe
  class Board
    attr_reader :spaces

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

    def winning_space_for(player)
      open_spaces.detect do |space|
        space.winning_space_for? player
      end
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
