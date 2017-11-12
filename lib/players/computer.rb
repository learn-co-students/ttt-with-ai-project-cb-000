module Players
  class Computer < Player
    def initialize(board)
      super
    end

    def move(board)
      free = []
      board.cells.each_with_index {|c, i| free << i if c == " "}
      (free.sample+1).to_s
    end
  end
end
