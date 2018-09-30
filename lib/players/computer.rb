module Players
  class Computer < Player

    MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def move(board)
      #return a valid move somehow!
      #develop AI here
      MOVES.find{|pos| !board.taken?(pos)}
    end
  end
end
