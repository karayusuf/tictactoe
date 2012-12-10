module TicTacToe
  class Space
    attr_reader :value, :index

    def initialize(value, index)
      @value = value
      @index = index
    end

    def row
      @index / 3
    end

    def column
      @index % 3
    end

    def to_s
      "#{row} #{column}"
    end

    def open?
      @value == "_"
    end
  end
end
