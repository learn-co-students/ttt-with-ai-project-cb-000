module Players
  class Human < Player

    def move(board)
      input = ""
      puts "Please enter your next move (1-9): "
      loop do
        input = gets.strip
        break if (1..9).include?(input.to_i)
      end
      input
    end
  end
end
