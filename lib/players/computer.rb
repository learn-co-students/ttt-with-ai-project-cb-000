class Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [3,5],
      [1,7],
      [0,8],
      [6,2]
    ]

    def move(board)
      board.display
      puts ""
      if board.cells[4] == " "
        return "5"
      elsif board.cells[4] == self.token
        WIN_COMBINATIONS.each do |combo|
          potential_win = false
          combo.each do |slot|
            potential_win = true if board.cells[slot] == self.token
          end
          if potential_win
            combo.each do |slot|
              return (slot+1).to_s if board.cells[slot] == " "
            end
          end
        end
        move = 1
        board.cells.each do |cell|
          return move.to_s if cell == " "
          move += 1
        end
      end
    else
      opponent_token = "X" if self.token == "O"
      opponent_token = "O" if self.token == "X"
      WIN_COMBINATIONS.each do |combo|
        potential_loss = false
        combo.each do |slot|
          potential_loss = true if board.cells[slot] == opponent_token
        end
        if potential_loss
          combo.each do |slot|
            return (slot+1).to_s if board.cells[slot] == " "
          end
        end
      end
      move = 1
      board.cells.each do |cell|
        return move.to_s if cell == " "
        move += 1
      end
    end
  end

end
