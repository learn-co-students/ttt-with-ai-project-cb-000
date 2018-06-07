module Players
  class Computer < Player
    def move(board)
      input = board.cells.index(" ")
      input += 1
      input.to_s
      # input
    end
  end
end

board = ["X","O"," "]
