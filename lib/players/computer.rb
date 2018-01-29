require 'game.rb'
require 'board.rb'

class Players
	class Computer < Player
		def move(board)
			input = gets.chomp #random move between 1-9?
			if board.valid_move?(input) == true
				 computer_move = Random.new		
				 computer_move = computer_move.rand(1..9)
				 computer_move
			end
		end
	end
end
