module Players
  class Human < Player
    def move(board)
      puts "enter a position please.."
      input = ""
      while !(board.valid_move?(input))
        input = gets.chomp
      end
      return input
    end
  end
end
