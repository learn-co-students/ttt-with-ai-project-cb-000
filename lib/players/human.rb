class Players
  class Human < Player
    def move(board)
      puts "Where would you like to go?"
      input = gets.strip
      board[input.to_i - 1] = self.token
      input
    end
  end
end
