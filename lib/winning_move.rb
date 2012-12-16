module TicTacToe
  class WinningMove

    def self.find player, board
      board.open_spaces.detect do |space|
        space.winning_space_for? player
      end
    end

  end
end
