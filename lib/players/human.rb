class Players
  class Human < Player
    def move(board)
      puts "Where would you like to go?"
      input = gets.strip
      return nil if input.to_i == 0
      board[input.to_i - 1] = self.token
      input
    end
  end
end
