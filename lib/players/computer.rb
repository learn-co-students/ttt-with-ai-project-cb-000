module Players

  class Computer < Player

    def move(board)
     moves = []
     if board.cells == Array.new(9, " ")
       first_move
     else
       input = rand(1..9).to_s
     end
   end


  def first_move
    input = ["2", "4", "6", "8", "10"].sample
  end

  end

end
