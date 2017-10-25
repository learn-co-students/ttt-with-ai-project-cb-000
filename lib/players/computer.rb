module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      elsif board.cells[0] == self.token && board.cells[1] == self.token && board.cells[2] == " "
        "3"
      elsif board.cells[1] == self.token && board.cells[2] == self.token && board.cells[0] == " "
        "1"
      elsif board.cells[2] == self.token && board.cells[0] == self.token && board.cells[1] == " "
        "2"
      elsif board.cells[3] == self.token && board.cells[4] == self.token && board.cells[5] == " "
        "6"
      elsif board.cells[4] == self.token && board.cells[5] == self.token && board.cells[3] == " "
        "4"
      elsif board.cells[6] == self.token && board.cells[7] == self.token && board.cells[8] == " "
        "9"
      elsif board.cells[6] == self.token && board.cells[8] == self.token && board.cells[7] == " "
        "8"
      elsif board.cells[7] == self.token && board.cells[8] == self.token && board.cells[6] == " "
        "7"
      else
        board.valid_moves.sample
      end
    end
  end
end
