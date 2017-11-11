
module Players
  class Human < Player

    def move(board)
      if self.token == "X"
        puts "Player 1 pick 1-9"
        return gets
      elsif self.token == "O"
        puts "Player 2 pick 1-9"
        return gets
      else
        self.move(board)
      end
    end


  end
end
