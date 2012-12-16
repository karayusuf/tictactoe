require File.dirname(__FILE__) + '/../lib/fork_space'

module TicTacToe
  describe ForkSpace do
    context "When the player can complete a fork on the center" do
      it "finds the center" do
        board = Board.new([ ["X", "X", "O"],
                            ["O", "_", "_"],
                            ["X", "_", "_"] ])

        fork_space = ForkSpace.find("X", board)
        fork_space.row_and_column.should eql "1 1"
      end
    end

    context "when the player can complete a fork on a corner" do
      it "finds the top left corner" do
        board = Board.new([ ["_", "X", "_"],
                            ["_", "X", "O"],
                            ["_", "O", "_"] ])

        fork_space = ForkSpace.find("X", board)
        fork_space.row_and_column.should eql "0 0"
      end

      it "finds the top right corner" do
        board = Board.new([ ["_", "X", "_"],
                            ["_", "O", "_"],
                            ["_", "O", "X"] ])

        fork_space = ForkSpace.find("X", board)
        fork_space.row_and_column.should eql "0 2"
      end

      it "finds the bottom left corner" do
        board = Board.new([ ["_", "_", "_"],
                            ["X", "O", "O"],
                            ["_", "_", "X"] ])

        fork_space = ForkSpace.find("X", board)
        fork_space.row_and_column.should eql "2 0"
      end

      it "finds the bottom right corner" do
        board = Board.new([ ["_", "O", "X"],
                            ["_", "O", "_"],
                            ["_", "X", "_"] ])

        fork_space = ForkSpace.find("X", board)
        fork_space.row_and_column.should eql "2 2"
      end
    end

    context "when the player can complete a fork on an edge" do
      it "finds the top edge" do
        board = Board.new([ ["O", "_", "_"],
                            ["X", "O", "_"],
                            ["_", "_", "X"] ])

        fork_space = ForkSpace.find("O", board)
        fork_space.row_and_column.should eql "0 1"
      end

      it "finds the left edge" do
        board = Board.new([ ["O", "X", "_"],
                            ["_", "O", "_"],
                            ["_", "_", "X"] ])

        fork_space = ForkSpace.find("O", board)
        fork_space.row_and_column.should eql "1 0"
      end

      it "finds the right edge" do
        board = Board.new([ ["_", "X", "O"],
                            ["_", "O", "_"],
                            ["X", "_", "_"] ])

        fork_space = ForkSpace.find("O", board)
        fork_space.row_and_column.should eql "1 2"
      end

      it "finds the bottom edge" do
        board = Board.new([ ["_", "_", "X"],
                            ["X", "O", "_"],
                            ["O", "_", "_"] ])

        fork_space = ForkSpace.find("O", board)
        fork_space.row_and_column.should eql "2 1"
      end
    end
  end
end
