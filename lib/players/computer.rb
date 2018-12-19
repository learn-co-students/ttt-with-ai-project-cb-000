module Players

  class Computer < Player

    def move(board)
      spot = 1
      index = 0
      board.cells.each do |cell|
        index += 1
        if cell == " "
          spot = "#{index}"
        end
      end
      return spot
    end

  end

end
