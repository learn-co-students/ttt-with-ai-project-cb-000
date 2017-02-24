module Players
	class Computer < Player

		def move(board)
			potential = board.cells.dup
			if potential[0] == ' '
				'1'
			elsif potential[4] == ' '
				'5'
			else
				sel = (0..potential.size-1).select { |i| potential[i] == ' ' }.sample
				(sel + 1).to_s
			end
		end

		# simplest:
		# get available cells
		# place in one at random

		# a little harder:
		# get available cells
		# see if there's a placement of computer's token
		# place next to it if possible (must define 'next to it' - scan WIN_COMBOS?)
		# else, place at random

		# hardest: minimax?
		# MUST BE ABLE TO DESCRIBE MINIMAX IN YOUR OWN WORDS!!!!!!

		# def available_cells(board)

		# end

	end
end