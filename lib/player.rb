module TicTacToe
  class Player
    def initialize(player, board)
      @player = player
      @board  = board
    end

    def should_block_opponent?
    end

    def move
      print @board.open_spaces.sample.to_s
    end
  end
end
