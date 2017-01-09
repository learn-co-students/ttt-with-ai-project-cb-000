class Board

	attr_accessor :cells

	def initialize
		@cells = Array.new(9," ")
#		s = 0
#		while s < 10
#			@cells[s] << ("")
#			s += 1
#		end
	end

	def reset!
		i=0
		while i<9
			@cells[i]=" "
			i+=1
		end
	end

	def display
		puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
		puts "-----------"
		puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
		puts "-----------"
		puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
	end

	def position(input)
		@cells[(input.to_i)-1]
	end

	def full?
		@cells.all?{|s| s!=" "}
	end

	def turn_count
		@cells.count{|s| s=="X" || s=="O"}
	end

	def taken?(input)
		self.position(input) == "X" || self.position(input) == "O"
	end

	def valid_move?(input)
		input.to_i >=1 && input.to_i <=9 && self.taken?(input) == false
	end

	def update(input,player)
		if valid_move?(input)
			@cells[(input.to_i)-1] = player.token
		end
	end


end