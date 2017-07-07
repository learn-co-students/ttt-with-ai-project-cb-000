module Players

  class Human < Player

    def move(board)
        puts "Please enter your move: '#{self.token}'"
        move = gets.chomp
      move
    end
  end

end
