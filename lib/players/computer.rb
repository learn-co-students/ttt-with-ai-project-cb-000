module Players
	class Computer < Player

		# minimax was supposed to be here, but hasn't showed up :)

		# for now, computer looks at the center and the top right corner
		# and either places there or selects an available space randomly.

		# any help with implementing minimax here would be strongly appreciated!

		def move(board)
			potential = board.cells.dup
 			return '5' if potential[4] == ' '
 			'1' if potential[0] == ' ' || potential[4] != ' '
			sel = (0..potential.size-1).select { |i| potential[i] == ' ' }.sample
			(sel + 1).to_s
		end

	end
end