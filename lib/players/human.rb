module Players

  class Human < Player

    def move(board)
      puts "Please move"
      move = gets.chomp
      move
    end

  end
  
end
