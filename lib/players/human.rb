require 'game.rb'
require 'board.rb'

class Players
	class Human < Player
		def move(pos=1)
			puts "Please enter 1-9:"
			user_input = gets.chomp
			user_input
		end
	end
end
