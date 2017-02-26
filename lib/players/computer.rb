require 'pry'

module Players
	class Computer < Player
		def move(board)
			if !board.taken?("5")
				"5"
			else
				strategies
			end
		end
	end
end	