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
      context "when there is no winning space" do
        let(:board) do
          Board.new([
            ["_", "_", "_"],
            ["_", "_", "_"],
            ["_", "_", "_"]
          ])
        end

        it "does not find a space for player 'X'" do
          board.winning_space_for("X").should be_nil
        end

        it "does not find a space for player 'O'" do
          board.winning_space_for("O").should be_nil
        end
      end


      shared_examples_for "a player that can complete a row" do
        let(:board) do
          Board.new([
            ["_", "X", "X"],
            ["_", "_", "_"],
            ["_", "_", "_"]
          ])
        end

        it "returns the space that wins the game" do
          space = board.winning_space_for("X")
          space.should eql "0 0"
        end
      end

      it_should_behave_like "a player that can complete a row"
    end

  end
end
