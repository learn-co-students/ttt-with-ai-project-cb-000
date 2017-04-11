require_relative '../player.rb'
module Players

  class Human < Player

    def move(input)
      puts "Where would like to move?"
      input = gets.strip
    end

    end

end
