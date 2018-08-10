require 'pry'
module Players 
  class Human < Player 
    def move(board)
      input = gets
      if !board.valid_move?(input)
        input = gets
      end
      input
    end
  end
end