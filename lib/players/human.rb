module Players
  class Human < Player

    def move(board)
      puts "Enter valid move (1-9):"
      selection = gets.strip
      sleep(1)
      selection
    end
  end
end
