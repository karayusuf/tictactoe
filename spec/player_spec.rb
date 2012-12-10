require 'rspec'
require File.dirname(__FILE__) + '/../lib/player'

module TicTacToe
  describe Player do
    describe "#opponent" do
      it "is X when the player is O" do
        player = Player.new("O", [])
        player.opponent.should eql "X"
      end

      it "is O when the player is X" do
        player = Player.new("X", [])
        player.opponent.should eql "O"
      end
    end

    describe "#move" do
      context "when the player can complete a row" do
        context "and the winning space is in the first column" do
          it "finds the winning space" do
            player = Player.new("O", [
              ["_", "_", "_"],
              ["_", "O", "O"],
              ["_", "_", "_"]
            ])

            player.move.row_and_column.should eql "1 0"
          end
        end

        context "and the winning space is in the second column" do
          it "finds the winning space" do
            player = Player.new("X", [
              ["_", "_", "_"],
              ["X", "_", "X"],
              ["_", "_", "_"]
            ])

            player.move.row_and_column.should eql "1 1"
          end
        end

        context "and the winning space is in the third column" do
          it "finds the winning space" do
            player = Player.new("X", [
              ["_", "_", "_"],
              ["_", "_", "_"],
              ["X", "X", "_"]
            ])

            player.move.row_and_column.should eql "2 2"
          end
        end
      end
    end
  end
end
