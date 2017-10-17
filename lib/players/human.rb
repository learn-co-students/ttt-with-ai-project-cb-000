require 'pry'

class Players
  class Human < Player

    def move(input)
      puts "To make a move, please enter a number value from 1 - 9."
      input = gets.strip
      input
    end
  end
end
