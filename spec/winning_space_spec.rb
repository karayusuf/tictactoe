require 'rspec'
require File.dirname(__FILE__) + '/../lib/winning_space'

module TicTacToe
  describe WinningSpace do
    context "when there is no winning space" do
      let(:board) do
        Board.new([ ["_", "_", "_"],
                    ["_", "_", "_"],
                    ["_", "_", "_"] ])
      end

      it "does not find a space for player 'X'" do
        WinningSpace.find("X", board).should be_nil
      end

      it "does not find a space for player 'O'" do
        WinningSpace.find("O", board).should be_nil
      end
    end

    context "when the player can complete a row" do
      it "finds the winning space in the first column" do
        board = Board.new([ ["_", "X", "X"],
                            ["_", "_", "_"],
                            ["_", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(0, 0)
      end

      it "finds the winning space in the second column" do
        board = Board.new([ ["X", "_", "X"],
                            ["_", "_", "_"],
                            ["_", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(0, 1)
      end

      it "finds the winning space in the third column" do
        board = Board.new([ ["X", "X", "_"],
                            ["_", "_", "_"],
                            ["_", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(0, 2)
      end
    end

    context "when the player can complete a column" do
      it "finds the winning space in the first row" do
        board = Board.new([ ["_", "_", "_"],
                            ["_", "_", "X"],
                            ["_", "_", "X"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(0, 2)
      end

      it "finds the winning space in the second row" do
        board = Board.new([ ["_", "_", "X"],
                            ["_", "_", "_"],
                            ["_", "_", "X"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(1, 2)
      end

      it "finds the winning space in the third row" do
        board = Board.new([ ["_", "X", "_"],
                            ["_", "X", "_"],
                            ["_", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(2, 1)
      end
    end

    context "when the player can complete a forward slash" do
      it "finds the winning space in the bottom left" do
        board = Board.new([ ["_", "_", "X"],
                            ["_", "X", "_"],
                            ["_", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(2, 0)
      end

      it "finds the winning space in the center" do
        board = Board.new([ ["_", "_", "X"],
                            ["_", "_", "_"],
                            ["X", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(1, 1)
      end

      it "finds the winning space in the top right" do
        board = Board.new([ ["_", "_", "_"],
                            ["_", "X", "_"],
                            ["X", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(0, 2)
      end
    end

    context "when the player can complete a back slash" do
      it "finds the winning space in the top left" do
        board = Board.new([ ["_", "_", "_"],
                            ["_", "X", "_"],
                            ["_", "_", "X"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(0, 0)
      end

      it "finds the winning space in the center" do
        board = Board.new([ ["X", "_", "_"],
                            ["_", "_", "_"],
                            ["_", "_", "X"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(1, 1)
      end

      it "finds the winning space in the bottom right" do
        board = Board.new([ ["X", "_", "_"],
                            ["_", "X", "_"],
                            ["_", "_", "_"] ])

        space = WinningSpace.find("X", board)
        space.should eql board.find_space(2, 2)
      end
    end

  end
end
