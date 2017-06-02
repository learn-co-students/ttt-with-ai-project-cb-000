require_relative '../player'

module Players
  class Human < Player
    def move(board)
      puts ("Please enter 1-9:")
      print ">> "; input = gets.chomp ; puts ""
      return input
    end
  end
end
