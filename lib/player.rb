require 'pry'

class Player

	attr_reader :token

	def initialize(token)
		@token=token
	end

end

class Players

	class Human < Player
		
		def move(board)
			
			input=gets
			if board.valid_move?(input)
				board.update(input,self)
				input
			else
				puts "Invalid move! Please enter number 1-9"
				self.move(board)
			end

		end

	end

	class Computer < Player
		WIN_COMBINATIONS=[
			[0,1,2],
			[3,4,5],
			[6,7,8],
			[0,3,6],
			[1,4,7],
			[2,5,8],
			[0,4,8],
			[6,4,2]
		]

		def move(board)
			
			priority_arrays=WIN_COMBINATIONS.select{|array| (array.collect{|index|board.cells[index]}.count("X")==2 && array.collect{|index|board.cells[index]}.count(" ")==1) || (array.collect{|index|board.cells[index]}.count("O")==2 && array.collect{|index|board.cells[index]}.count(" ")==1)}
			
			if priority_arrays!=[]
				top_priority_array=priority_arrays.find{|array| board.cells[array[0]]==self.token || board.cells[array[1]]==self.token}
				if top_priority_array
					vacancy=top_priority_array.find{|index|board.cells[index]==" "}
					board.update(vacancy+1,self)
				else
					priority_arrays[0].each do |index|
						if board.cells[index]==" "
							board.update(index+1,self)
						end
					end
				end
			elsif board.cells[4]==" "
				board.update(5, self)
			elsif board.cells[0]!=self.token && board.cells[0]!=" " && board.cells[8]!=self.token && board.cells[8]!=" "
				board.update(2, self)
			elsif board.cells[2]!=self.token && board.cells[2]!=" " && board.cells[6]!=self.token && board.cells[6]!=" "
				board.update(2, self)
			elsif board.cells[0]==" " && board.cells[8]!=self.token && board.cells[8]!=" "
				board.update(1, self)
			elsif board.cells[2]==" " && board.cells[6]!=self.token && board.cells[6]!=" "
				board.update(3, self)
			elsif board.cells[6]==" " && board.cells[2]!=self.token && board.cells[2]!=" "
				board.update(7, self)
			elsif board.cells[8]==" " && board.cells[0]!=self.token && board.cells[0]!=" "
				board.update(9, self)
			elsif board.cells[0]==" "
				board.update(1,self)
			elsif board.cells[8]==" "
				board.update(9,self)
			elsif board.cells[2]==" "
				board.update(3,self)
			elsif board.cells[6]==" "
				board.update(7,self)
			else
				board.update(board.cells.index(" ")+1, self)
			end
			
			sleep(2)
		
		end
	
	end

end