module Players
	class Computer < Player

		def move(board)
			potential = board.cells.dup
 			return '5' if potential[4] == ' '
 			'1' if potential[0] == ' ' || potential[4] != ' '
			sel = (0..potential.size-1).select { |i| potential[i] == ' ' }.sample
			(sel + 1).to_s
		end

	end
end