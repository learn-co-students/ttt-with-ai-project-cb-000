module Players
  class Human < Player

    def move(board)
      board.display
      puts "Please choose a space from 1-9"
      input = gets
      input
    end
  end

end
