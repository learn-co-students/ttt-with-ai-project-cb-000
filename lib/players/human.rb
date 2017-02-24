module Players
	class Human < Player

		def move(board)
			move = gets.strip
			#If there is no board we cant validate the move and the loop will exit
			while board.is_a?(Board) && !board.valid_move?(move)
				puts "Invalid move, please try again: "
				move = gets.chomp
			end
			move
		end

	end
end
