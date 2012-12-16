require 'rspec'
require File.dirname(__FILE__) + '/../lib/board'

module TicTacToe
  describe Board do

    describe "#open_spaces" do
      let(:board) do
        Board.new([
          ["_", "X", "O"],
          ["X", "O", "O"],
          ["_", "_", "_"]
        ])
      end

      it "finds spaces that have not been marked" do
        board.open_spaces.should have(4).open_spaces
      end
    end

    describe "#winning_space_for" do
    end

  end
end
