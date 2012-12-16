require 'rspec'
require File.dirname(__FILE__) + '/../lib/space'

module TicTacToe
  describe Space do
    let(:board) do
      Board.new([
        [ "_", "_", "_"],
        [ "X", "O", "_"],
        [ "X", "_", "_"]
      ])
    end

    describe "#board" do
      it "knows the board it is on" do
        space = Space.new("_", 0, board)
        space.board.should eql board
      end
    end

    describe "#row" do
      context "first row" do
        it "contains the first space" do
          space = Space.new("_", 0, board)
          space.row.should eql 0
        end

        it "contains the second space" do
          space = Space.new("_", 1, board)
          space.row.should eql 0
        end

        it "contains the third space" do
          space = Space.new("_", 2, board)
          space.row.should eql 0
        end
      end

      context "second row" do
        it "contains the fourth space" do
          space = Space.new("_", 3, board)
          space.row.should eql 1
        end

        it "contains the fifth space" do
          space = Space.new("_", 4, board)
          space.row.should eql 1
        end

        it "contains the sixth space" do
          space = Space.new("_", 5, board)
          space.row.should eql 1
        end
      end

      context "third row" do
        it "contains the seventh space" do
          space = Space.new("_", 6, board)
          space.row.should eql 2
        end

        it "contains the eighth space" do
          space = Space.new("_", 7, board)
          space.row.should eql 2
        end

        it "contains the nineth space" do
          space = Space.new("_", 8, board)
          space.row.should eql 2
        end
      end
    end

    describe "#column" do
      context "first column" do
        it "contains the first space" do
          space = Space.new("_", 0, board)
          space.column.should eql 0
        end

        it "contains the fourth space" do
          space = Space.new("_", 3, board)
          space.column.should eql 0
        end

        it "contains the seventh space" do
          space = Space.new("_", 6, board)
          space.column.should eql 0
        end
      end

      context "second column" do
        it "contains the second space" do
          space = Space.new("_", 1, board)
          space.column.should eql 1
        end

        it "contains the fifth space" do
          space = Space.new("_", 4, board)
          space.column.should eql 1
        end

        it "contains the eighth space" do
          space = Space.new("_", 7, board)
          space.column.should eql 1
        end
      end

      context "third column" do
        it "contains the third space" do
          space = Space.new("_", 2, board)
          space.column.should eql 2
        end

        it "contains the sixth space" do
          space = Space.new("_", 5, board)
          space.column.should eql 2
        end

        it "contains the ninth space" do
          space = Space.new("_", 8, board)
          space.column.should eql 2
        end
      end
    end

    describe "#row_and_column" do
      it "displays the row and column" do
        space = Space.new("_", 8, board)
        space.row_and_column.should eql "2 2"
      end
    end

    describe "#open?" do
      it "is open for a value of '_'" do
        space = Space.new("_", 0, board)
        space.should be_open
      end

      it "is not open when the value is not '_'" do
        space = Space.new("X", 0, board)
        space.should_not be_open
      end
    end

    describe "#marked_by?" do
      context "when the space is marked" do
        let(:space) { Space.new("X", 0, board) }

        it "is marked by the player" do
          space.should be_marked_by "X"
        end

        it "is not marked by the player" do
          space.should_not be_marked_by "O"
        end
      end

      context "when the space is open" do
        it "is not marked by the player" do
          space = Space.new("_", 0, board)
          space.should_not be_marked_by "X"
          space.should_not be_marked_by "O"
        end
      end
    end

    describe "#winning_space_for?" do
      context "row" do
        context "when a player can complete a row" do
          it "is the winning space" do
            board = Board.new([
                              ["_", "X", "X"],
                              ["_", "_", "_"],
                              ["_", "_", "_"]
            ])

            space = board.spaces.first
            space.should be_winning_space_for "X"
          end

          it "is not the winning space if it has been taken" do
            board = Board.new([ ["O", "X", "X"],
                                ["_", "_", "_"],
                                ["_", "_", "_"] ])

            space = board.spaces.first
            space.should_not be_winning_space_for "X"
          end
        end

        context "when a player cannot complete a row" do
          it "is not the winning space when only one space is marked" do
            board = Board.new([
                              ["_", "_", "X"],
                              ["_", "_", "_"],
                              ["_", "_", "_"]
            ])

            space = board.spaces.first
            space.should_not be_winning_space_for "X"
          end

          it "is not the winning space when no spaces have been marked" do
            board = Board.new([
                              ["_", "_", "_"],
                              ["_", "_", "_"],
                              ["_", "_", "_"]
            ])

            space = board.spaces.first
            space.should_not be_winning_space_for "X"
          end
        end
      end

      context "column" do
        let(:board) do
          Board.new([ ["X", "O", "O"],
                      ["X", "O", "_"],
                      ["_", "X", "_"] ])
        end

        context "when a player can complete the column" do
          it "is the winning space" do
            space = board.find_space(2, 0)
            space.should be_winning_space_for "X"
          end
        end

        context "when a player cannot complete a column" do
          it "is not the winning space if it has been marked" do
            space = board.find_space(0, 1)
            space.should_not be_winning_space_for "X"
          end

          it "is not the winning space when only one space has been marked" do
            space = board.find_space(1, 2)
            space.should_not be_winning_space_for "X"
          end
        end
      end
    end
  end
end
