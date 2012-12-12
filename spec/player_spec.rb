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
        it "finds the winning space in the first column" do
          player = Player.new("O", [ ["_", "_", "_"],
                                     ["_", "O", "O"],
                                     ["_", "_", "_"] ])

          player.move.row_and_column.should eql "1 0"
        end

        it "finds the winning space in the second column" do
          player = Player.new("X", [ ["_", "_", "_"],
                                     ["X", "_", "X"],
                                     ["_", "_", "_"] ])

          player.move.row_and_column.should eql "1 1"
        end

        it "finds the winning space in the third column" do
          player = Player.new("X", [ ["_", "_", "_"],
                                     ["_", "_", "_"],
                                     ["X", "X", "_"] ])

          player.move.row_and_column.should eql "2 2"
        end
      end

      context "when the player can complete a column" do
        it "finds the winning space in the first row" do
          player = Player.new("O", [ ["_", "_", "_"],
                                     ["_", "_", "O"],
                                     ["_", "_", "O"] ])

          player.move.row_and_column.should eql "0 2"
        end

        it "finds the winning space in the second row" do
          player = Player.new("X", [ ["_", "X", "_"],
                                     ["_", "_", "_"],
                                     ["_", "X", "_"] ])

          player.move.row_and_column.should eql "1 1"
        end

        it "finds the winning space in the third row" do
          player = Player.new("O", [ ["O", "_", "_"],
                                     ["O", "_", "_"],
                                     ["_", "_", "_"] ])

          player.move.row_and_column.should eql "2 0"
        end
      end

      context "when the player can complete a diagonal up" do
        it "finds the winning space in the top right corner" do
          player = Player.new("O", [ ["_", "_", "_"],
                                     ["_", "O", "_"],
                                     ["O", "_", "_"] ])

          player.move.row_and_column.should eql "0 2"
        end

        it "finds the winning space in the center" do
          player = Player.new("O", [ ["_", "_", "O"],
                                     ["_", "_", "_"],
                                     ["O", "_", "_"] ])

          player.move.row_and_column.should eql "1 1"
        end

        it "finds the winning space in the bottom left corner" do
          player = Player.new("O", [ ["_", "_", "O"],
                                     ["_", "O", "_"],
                                     ["_", "_", "_"] ])

          player.move.row_and_column.should eql "2 0"
        end
      end
    end
  end
end
