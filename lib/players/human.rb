

module Players
  class Human < Player
    def move(board)
      puts "Where would you like to go?"
      location = gets.chomp
      location
    end
  end
end
