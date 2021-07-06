module Players
  class Computer < Player

    def move(board)
      ("1".."9").each do |pos|
        return pos if board.valid_move?(pos)
      end
    end
    
  end
end
