#have move in here
require "pry"

module Players
  class Human < Player

    def move(board)
      puts "Please enter your move!"
      move_position = gets.chomp
      move_position
    end

  end
end
