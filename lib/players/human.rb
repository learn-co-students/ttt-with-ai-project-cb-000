module Players
  class Human < Player

    def move(board)
      puts "Enter number 1-9"
      input = gets.chomp
    end

  end
end
