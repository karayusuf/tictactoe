require 'rspec'
require File.dirname(__FILE__) + '/../lib/space'

module TicTacToe
  describe Space do
    describe "#row" do
      context "first row" do
        it "contains the first space" do
          space = Space.new(anything, 0)
          space.row.should eql 0
        end

        it "contains the second space" do
          space = Space.new(anything, 1)
          space.row.should eql 0
        end

        it "contains the third space" do
          space = Space.new(anything, 2)
          space.row.should eql 0
        end
      end

      context "second row" do
        it "contains the fourth space" do
          space = Space.new(anything, 3)
          space.row.should eql 1
        end

        it "contains the fifth space" do
          space = Space.new(anything, 4)
          space.row.should eql 1
        end

        it "contains the sixth space" do
          space = Space.new(anything, 5)
          space.row.should eql 1
        end
      end

      context "third row" do
        it "contains the seventh space" do
          space = Space.new(anything, 6)
          space.row.should eql 2
        end

        it "contains the eighth space" do
          space = Space.new(anything, 7)
          space.row.should eql 2
        end

        it "contains the nineth space" do
          space = Space.new(anything, 8)
          space.row.should eql 2
        end
      end
    end

    describe "#column" do
      context "first column" do
        it "contains the first space" do
          space = Space.new(anything, 0)
          space.column.should eql 0
        end

        it "contains the fourth space" do
          space = Space.new(anything, 3)
          space.column.should eql 0
        end

        it "contains the seventh space" do
          space = Space.new(anything, 6)
          space.column.should eql 0
        end
      end

      context "second column" do
        it "contains the second space" do
          space = Space.new(anything, 1)
          space.column.should eql 1
        end

        it "contains the fifth space" do
          space = Space.new(anything, 4)
          space.column.should eql 1
        end

        it "contains the eighth space" do
          space = Space.new(anything, 7)
          space.column.should eql 1
        end
      end

      context "third column" do
        it "contains the third space" do
          space = Space.new(anything, 2)
          space.column.should eql 2
        end

        it "contains the sixth space" do
          space = Space.new(anything, 5)
          space.column.should eql 2
        end

        it "contains the ninth space" do
          space = Space.new(anything, 8)
          space.column.should eql 2
        end
      end
    end

    describe "#open?" do
      it "is open for a value of '_'" do
        space = Space.new("_", anything)
        space.should be_open
      end

      it "is not open when the value is not '_'" do
        space = Space.new("X", anything)
        space.should_not be_open
      end
    end

  end
end
