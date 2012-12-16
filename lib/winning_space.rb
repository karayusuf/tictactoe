module TicTacToe
  class WinningSpace

    def self.find player, board
      board.open_spaces.detect do |space|
        space.winning_space_for? player
      end
    end

    def self.find_all player, board
      board.open_spaces.select do |space|
        space.winning_space_for? player
      end
    end

  end
end
