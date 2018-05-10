module Players
	class Computer < Player
		CORNERS = [1, 3, 7, 9]

		def move(board)
			#puts "testing this stupid thing"
			my_move = nil
			# if the center spot is empty, move there
			if !board.taken?("5")
				#puts "FIRST MOVE IS ALWAYS 5"
				my_move = "5" 
			# if the turn count is between 1 & 5 (2-4), take a corner
			elsif board.turn_count > 1 && board.turn_count < 5
				#puts "WHY ISN'T THIS WORKING?!"
				my_move = CORNERS.detect { |cell| !board.taken?(cell) }.to_s

			# otherwise, check to see if either player is about to win
			else
				Game::WIN_COMBINATIONS.detect do |win_combo|

					# play a winning spot if you have two positions in a win combo
					if win_combo.select { |cell| board.position(cell + 1) == token }.size == 2 && win_combo.any?{ |cell| !board.taken?(cell + 1) }
						move = win_combo.select { |cell| !board.taken?(cell + 1) }.first.to_i + 1
						move.to_s
					# otherwise, block your opponent if they have two positions in a win_combo
					elsif win_combo.select { |cell| board.taken?(cell + 1) && board.position(cell + 1) != token}.size == 2 && win_combo.any? { |cell| !board.taken?(cell + 1) }
						move = win_combo.select { |cell| !board.taken?(cell + 1) }.first.to_i + 1
						move.to_s
					end
				end
				my_move = [1, 3, 7, 9, 2, 4, 6, 8].detect { |cell| !board.taken?(cell) }.to_s if my_move == nil
			end
			my_move 
		end
	end
end