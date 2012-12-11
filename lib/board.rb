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

    def winning_space_for(player)
      winner = open_spaces.detect do |space|
        space.winning_space_for?(player, self)
      end
    end

    private

    def identify_spaces(spaces)
      spaces = spaces.flatten.each_with_index
      spaces.map do |value, index|
        Space.new(value, index)
      end
    end
  end
end
