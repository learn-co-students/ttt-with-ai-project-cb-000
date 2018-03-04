# Players::Human inherits from Player
module Players
  class Human < Player
    # Players::Human #move asks the user for input and returns it
    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end
  end
end
