require 'rspec'
require File.dirname(__FILE__) + '/../lib/player'

module TicTacToe
  describe Player do
    context "#opponent" do
      it "is X when the player is O" do
        player = Player.new("O", anything)
        player.opponent.should eql "X"
      end

      it "is O when the player is X" do
        player = Player.new("X", anything)
        player.opponent.should eql "O"
      end
    end
  end
end
