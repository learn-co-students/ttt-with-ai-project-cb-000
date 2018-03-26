module Players
  class Human < Player

    def move(*board, input)
      puts "Please enter a number between 1 and 9"
      input = gets
    end

  end
end
