require 'game.rb'
require 'board.rb'

class Players
	class Computer < Player
		def move(board)		
			computer_move = Random.new
			 computer_move = computer_move.rand(0..9)
			if board.valid_move?(computer_move) == true
				 return computer_move.to_s	
			end
		end
	end
end
