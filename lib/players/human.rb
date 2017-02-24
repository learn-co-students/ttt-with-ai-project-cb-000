module Players
	class Human < Player

		def move(board)
			print 'Your selection: '
			gets.strip
		end

	end
end