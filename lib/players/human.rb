module Players
  class Human < Player
    def move(board)
      puts "Please select an available number between 1 and 9"
      gets.chomp
    end
  end
end
