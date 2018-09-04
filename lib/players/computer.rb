require 'pry'
class Players
  class Computer < Player

    def move(board)
      valid_move = board.cells.index(" ")
      valid_move += 1
      valid_move.to_s
    end

  end
end
