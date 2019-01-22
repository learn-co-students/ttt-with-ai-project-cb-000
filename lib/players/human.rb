require 'pry'
module Players 
  class Human < Player 
    def move(board)
      puts "Input move [1-9]"
      input = gets.chomp
      while !board.valid_move?(input)
        puts "Input move [1-9]"
        input = gets.chomp
      end
      input
    end
  end
end