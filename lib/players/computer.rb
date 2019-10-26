module Players
  class Computer < Player
    def move(board)
      if board.winning_move(self)
        board.winning_move(self)
      elsif board.cells[4] == " " # aim for middle
        "5"
      elsif board.empty_corner_cells
        board.empty_corner_cells.sample
      else
        board.valid_moves.sample
      end
    end
  end
end
