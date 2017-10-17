class Players
  class Computer < Player

    def move(board)
      if board.cells[4] == " "
        "5"
      elsif self.token == "X"
        if board.cells[0] == "O" && board.cells[2] == "O" && board.cells[1] == " "
          "2"
        elsif board.cells[0] == "O" && board.cells[6] == "O" && board.cells[3] == " "
          "4"
        elsif board.cells[2] == "O" && board.cells[8] == "O" && board.cells[5] == " "
          "6"
        elsif board.cells[6] == "O" && board.cells[8] == "O" && board.cells[7] == " "
          "8"
        else
          if board.valid_move?(1)
            "1"
          elsif board.valid_move?(2)
            "2"
          elsif board.valid_move?(3)
            "3"
          elsif board.valid_move?(4)
            "4"
          elsif board.valid_move?(6)
            "6"
          elsif board.valid_move?(7)
            "7"
          elsif board.valid_move?(8)
            "8"
          elsif board.valid_move?(9)
            "9"
          end
        end
      elsif self.token == "O"
        if board.cells[0] == "X" && board.cells[2] == "X" && board.cells[1] == " "
          "2"
        elsif board.cells[0] == "X" && board.cells[6] == "X" && board.cells[3] == " "
          "4"
        elsif board.cells[2] == "X" && board.cells[8] == "X" && board.cells[5] == " "
          "6"
        elsif board.cells[6] == "X" && board.cells[8] == "X" && board.cells[7] == " "
          "8"
        else
          if board.valid_move?(1)
            "1"
          elsif board.valid_move?(2)
            "2"
          elsif board.valid_move?(3)
            "3"
          elsif board.valid_move?(4)
            "4"
          elsif board.valid_move?(6)
            "6"
          elsif board.valid_move?(7)
            "7"
          elsif board.valid_move?(8)
            "8"
          elsif board.valid_move?(9)
            "9"
          end
        end
      end
    end
  end
end
