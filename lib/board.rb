class Board

	attr_accessor :cells

	def initialize()
		reset!
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def update(index, player)
		cells[index.to_i-1] = player.token
	end

	def position(index)
		int_index = index.to_i
		return cells[int_index-1] if int_index > 0 && int_index < 10
		nil
	end

	def full?
		turn_count==cells.count
	end

	def turn_count
		cells.count {|v| v=="X"||v=="O"}
	end

	def taken?(index)
		value = position(index)
		value=="X"||value=="O"
	end

	def valid_move?(index)
		position(index)!=nil&&!taken?(index)
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

end
