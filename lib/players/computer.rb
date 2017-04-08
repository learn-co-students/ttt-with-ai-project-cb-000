class Players

  class Computer < Player

    def move(board)
      valid_moves = (1..9).to_a
      move = nil 
      until board.valid_move?(move)
        move = valid_moves.sample.to_s
      end
      return move
    end

  end
  
end
