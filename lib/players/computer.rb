module Players

  class Computer < Player

    def move(board)
      spot = 1
      index = 0
      if board.cells[4] == " "
        spot = "5"
      else
        board.cells.each do |cell|
          index += 1
          if cell == " "
            spot = "#{index}"
          end
        end
      end
      return spot
    end

  end

end
