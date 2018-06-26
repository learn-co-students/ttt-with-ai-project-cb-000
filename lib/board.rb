class Board

	#@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

	attr_accessor :cells

	def initialize
		reset!
	end

	def reset!
		@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display
	    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
	    puts "-----------"
	    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
	    puts "-----------"
	    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(input)
		@cells[input.to_i - 1]

	end

	def update(user_pos, player)
		user_pos = user_pos.to_i - 1
		@cells[user_pos] = player.token
	end

	def full?
		@cells.all? { |c| c == "X" || c == "O" }
	end

	def turn_count
		@cells.count { |c| c == "X" || c == "O" }
	end

	def taken?(input)
		pos = position(input)
    	!(pos.nil? || pos == " " || pos == "")
  	end

  	def valid_move?(input)
	    #input.to_i.between?(1, 9) && !taken?(input)
	    input = input.to_i
	    input.between?(1, 9) && !taken?(input)
  	end


end