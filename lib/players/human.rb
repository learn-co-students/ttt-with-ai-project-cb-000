module Players
	class Human < Player

		def move (array)
			puts"Where would you like to go?"
			gets.strip
		end
	end

end