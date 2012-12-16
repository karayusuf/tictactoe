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
      context "winner" do
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

        context "when the player can complete a diagonal down" do
          it "finds the winning space in the top left corner" do
            player = Player.new("O", [ ["_", "_", "_"],
                                ["_", "O", "_"],
                                ["_", "_", "O"] ])

            player.move.row_and_column.should eql "0 0"
          end

          it "finds the winning space in the center" do
            player = Player.new("O", [ ["O", "_", "_"],
                                ["_", "_", "_"],
                                ["_", "_", "O"] ])

            player.move.row_and_column.should eql "1 1"
          end

          it "finds the winning space in the bottom right corner" do
            player = Player.new("O", [ ["O", "_", "_"],
                                ["_", "O", "_"],
                                ["_", "_", "_"] ])

            player.move.row_and_column.should eql "2 2"
          end
        end
      end

      context "block" do
        context "row" do
          it "blocks the opponent in the first column" do
            player = Player.new("X", [ ["_", "O", "O"],
                                       ["_", "X", "_"],
                                       ["_", "_", "_"] ])

            player.move.row_and_column.should eql "0 0"
          end

          it "blocks the opponent in the second column" do
            player = Player.new("X", [ ["O", "_", "O"],
                                       ["_", "X", "_"],
                                       ["_", "_", "_"] ])

            player.move.row_and_column.should eql "0 1"
          end

          it "blocks the opponent in the third column" do
            player = Player.new("X", [ ["X", "_", "_"],
                                       ["O", "O", "_"],
                                       ["_", "_", "_"] ])

            player.move.row_and_column.should eql "1 2"
          end
        end

        context "column" do
          it "blocks the opponent in the first row" do
            player = Player.new("O", [ ["_", "_", "_"],
                                       ["X", "O", "_"],
                                       ["X", "_", "_"] ])

            player.move.row_and_column.should eql "0 0"
          end

          it "blocks the opponent in the second row" do
            player = Player.new("O", [ ["X", "_", "_"],
                                       ["_", "O", "_"],
                                       ["X", "_", "_"] ])

            player.move.row_and_column.should eql "1 0"
          end

          it "blocks the opponent in the third row" do
            player = Player.new("O", [ ["_", "_", "X"],
                                       ["_", "O", "X"],
                                       ["_", "_", "_"] ])

            player.move.row_and_column.should eql "2 2"
          end
        end

        context "diagonal up" do
          it "blocks the opponent in the bottom left corner" do
            player = Player.new("X", [ ["X", "_", "O"],
                                       ["_", "O", "_"],
                                       ["_", "_", "_"] ])

            player.move.row_and_column.should eql "2 0"
          end

          it "blocks the opponent in the center" do
            player = Player.new("X", [ ["X", "_", "O"],
                                       ["_", "_", "_"],
                                       ["O", "_", "_"] ])

            player.move.row_and_column.should eql "1 1"
          end

          it "blocks the opponent in the top right corner" do
            player = Player.new("X", [ ["X", "_", "_"],
                                       ["_", "O", "_"],
                                       ["O", "_", "_"] ])

            player.move.row_and_column.should eql "0 2"
          end
        end

        context "diagonal down" do
          it "blocks the opponent in the top left corner" do
            player = Player.new("X", [ ["_", "_", "X"],
                                       ["_", "O", "_"],
                                       ["_", "_", "O"] ])

            player.move.row_and_column.should eql "0 0"
          end

          it "blocks the opponent in the center" do
            player = Player.new("X", [ ["O", "_", "X"],
                                       ["_", "_", "_"],
                                       ["_", "_", "O"] ])

            player.move.row_and_column.should eql "1 1"
          end

          it "blocks the opponent in the bottom left corner" do
            player = Player.new("X", [ ["O", "_", "X"],
                                       ["_", "O", "_"],
                                       ["_", "_", "_"] ])

            player.move.row_and_column.should eql "2 2"
          end
        end
      end
    end

    context "when the player can create a fork" do
      it "creates the fork" do
        player = Player.new("O", [ ["O", "_", "_"],
                                   ["X", "O", "_"],
                                   ["_", "_", "X"] ])

        player.move.row_and_column.should eql "0 1"
      end
    end

    context "blocking a fork" do
      it "finds an edge when the opponent can create two forks" do
        player = Player.new("X", [ ["O", "_", "_"],
                                   ["_", "X", "_"],
                                   ["_", "_", "O"] ])

        player.move.row_and_column.should eql "0 1"
      end

      it "marks the fork when the opponent can only create on fork" do
        player = Player.new("X", [ ["_", "X", "_"],
                                   ["_", "O", "_"],
                                   ["_", "O", "_"] ])

        player.move.row_and_column.should eql "2 0"
      end
    end

  end
end
