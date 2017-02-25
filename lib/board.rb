require "pry"


class Board

	attr_accessor :cells

	@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

	def initialize
		self.reset!
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
		input = input_to_index(input)
		@cells[input.to_i]
	end

	def input_to_index(user_input)
		user_input.to_i - 1
	end

	 def full?
     if @cells.detect{|i| i == "" || i == " "}
       return false
     else
       return true
     end
   end

    def turn_count
     num_turns = 0
     @cells.each do |space|
       if space == "X" || space == "O"
         num_turns += 1
       end
     end
     return num_turns
   end

  	def taken?(loc)
  	 loc = input_to_index(loc.to_i)
     if(@cells[loc] == "X" || @cells[loc] == "O")
     	true
     else
     	false
     end
   end

   def valid_move?(move)
   	 move.to_i.between?(1, 9) && !taken?(move)

   end

   def update(move, player)
   		if(valid_move?(move))
   			move = input_to_index(move)
   			@cells[move] = player.token
   			@cells
   		end
   end

end


