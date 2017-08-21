module Players
	class Computer < Player
		def move (board)
			valid_moves = []
			(1..9).each do |s| 
				if board.valid_move?(s.to_s)==true
					valid_moves << s.to_s
				end
			end
			valid_moves.sample
		end

	end
end