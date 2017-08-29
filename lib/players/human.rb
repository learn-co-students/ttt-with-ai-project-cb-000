module Players

	class Human < Player

		def move(board)
			the_move = gets.chomp
			#the_move ||= "1"
			the_move
		end

	end
	
end