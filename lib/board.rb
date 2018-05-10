class Board
	attr_accessor :cells

	def initialize
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	# reset the board
	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	# display the current board
	def display
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	# Contents of request cell
	def position(input)
		@cells[input.to_i - 1]
	end

	# Is the board full
	def full?
		@cells.all? do |token|
			token == "X" || token == "O"
		end
	end

	# counts the number of non-empty cells to determine 
	# how many turns have been taken
	def turn_count
		counter = 0
		@cells.each do |cell|
			counter += 1 if cell == "X" || cell == "O"
		end
		counter
	end

	# returns true if the position is taken
	def taken?(input)
		!(@cells[input.to_i - 1].nil? || @cells[input.to_i - 1 ] == " ")
	end

	def valid_move?(input)
		input.to_i.between?(1, 9) && !taken?(input) ? true : false
	end

	def update(input, player)
		@cells[input.to_i - 1] = player.token
	end
end