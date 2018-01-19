require 'pry'

class Board
	attr_accessor :cells

	def initialize
		@cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
	end

	def cells
		@cells
	end

	def reset!
		@cells = [" ", " ", " "," ", " ", " "," ", " ", " "]
		@cells
	end

	def display 
		puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} /n-----------/n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} /n-----------/n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(number)
		#takes user input
		number = number.to_i
		ar_pos = number - 1
		return @cells[ar_pos]
	end

	def full?
		if @cells.include?(" ")
			return false 
		else
			return true
		end
	end

	def turn_count
		@turn = []
		@cells.each do |x_or_o| 
			if x_or_o == "X" 
				@turn << x_or_o
			elsif x_or_o == "O"
				@turn << x_or_o
			end
		end
		@turn_count = @turn.length
		return @turn_count
		#returns amount of turns based on cell value
	end 

	def taken?(input)
		#find position based on user input number
		input = input.to_i
		#converts number to array input
		input = input - 1
		@cells[input]
		#tells if array input is X or O 
		if @cells[input] == "X"
			return true
		elsif @cells[input] == "O"
			return true
		else 
			return false
		end 
			#returns taken if so
			#returns false if not
		#end 
	end

	def valid_move?(input)
		input = input.to_i
		#user input between 1-9 = valid input
		if input.between?(1,9)
			if self.taken?(input) == false
				return true
			else 
				return false
			end
		else 
			return false
		end 
	end

	def update(input, player)
		input = input.to_i #converts string to integer
		input = input - 1
			if input.even? == true
				@cells[input] = "X"
			elsif input.odd? == true
				@cells[input] = "O"
			end
	end

end
