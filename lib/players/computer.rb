module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      else
        board.valid_moves.sample
      end
    end
  end
end
