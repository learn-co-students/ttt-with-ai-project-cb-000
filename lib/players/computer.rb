module Players
  class Computer < Player
    def initialize(board)
    end

    def move(board)
      free = []
      board.cells.each_with_index {|c, i| free << i if c == " "}
      free.sample.to_s
    end
  end
end
