require File.dirname(__FILE__) + '/space'

module TicTacToe
  class Board
    attr_reader :spaces

    def initialize(board)
      @spaces = identify_spaces(board)
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

    def identify_spaces(board)
      board = board.flatten.each_with_index
      board.map do |value, index|
        Space.new(value, index)
      end
    end
  end
end
