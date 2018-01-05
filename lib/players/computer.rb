class Players
  class Computer < Player
    def move(board)
      indexes = []
      board.cells.each_with_index do |cell, i|
        indexes << (i + 1).to_s if cell == " "
      end
      indexes.sample
    end
  end
end
