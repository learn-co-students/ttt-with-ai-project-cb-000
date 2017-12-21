module Players
  class Computer < Player
    def move(board)
      (1 + rand(9)).to_s
    end

    def next_move_wins?(board)
      
    end
  end
end
