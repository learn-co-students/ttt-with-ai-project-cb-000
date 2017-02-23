class Board

	attr_accessor :cells

	def initialize
		self.cells = Array.new(9, " ")
	end

	def reset! # !RF!
		self.cells.clear
		9.times { self.cells << ' ' } 
	end

	def display
		self.cells.each_slice(3).with_index do |x, i|
			puts " #{x.join(' | ')} "
			next if i == 2
			puts "-----------"
		end
	end

	def input_to_index(input)
		input.to_i - 1
	end

	def position(input)
		self.cells[input_to_index(input)]
	end

	def full?
		!self.cells.any? { |cell| cell == ' ' }
	end

	def turn_count
		self.cells.count { |cell| cell != ' ' }
	end

	def taken?(input)
		self.position(input) != ' '
	end

	def valid_move?(input)
		input.to_i.between?(1, 9) && !taken?(input)
	end

	def update(input, player)
		self.cells[input.to_i - 1] = player.token
	end
end