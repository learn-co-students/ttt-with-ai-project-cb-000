module Players
  class Human < Player

    def move(board)
      puts "Enter a position 1 - 9:"
      cell = gets.strip
    end

  end
end
