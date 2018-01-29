require 'game.rb'
require 'board.rb'

class Players
	class Human < Player
		def move(board)
			gets
		end
	end
end
