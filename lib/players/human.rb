class Players
  class Human < Player

    def move(board)
      board.display
      puts ""
      puts "You are player #{self.token}."
      puts "Which move would you like to make? (Enter a value from 1 to 9.): "
      return gets.chomp
    end

  end
end
