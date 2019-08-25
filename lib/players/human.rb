module Players
  class Human < Player
    def move(board)
      puts "Choose a square (1-9):"
      choice = gets.chomp
      choice
    end
  end
end
