require 'pry'
require 'players/human'
require 'board'

class Game < Players::Human
	attr_accessor :board
	attr_writer :player_1, :player_2

 	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

 	def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
 		@board = board
 		@player_1 = player_1
 		@player_2 = player_2
 		@count = 0 
 	end

 	def self.board
 		@board
 	end

 	def board 
 		@board
 	end

 	#Player_1 is a kind of human player with token "X"

 	def player_1 
 		@token = "X"
 		@player_1
 	end

 	#Player_2 is a kind of human player with token "O"

 	def player_2
 		@token = "O"
 		@player_2
 	end

 	def self.player_1
 		@player_1
 	end

 	def self.player_2
 		@player_2
 	end 

 	def current_player
 		# count each move
 		if @board.turn_count.odd?  
 			return @player_2
 		else
 			return @player_1
 		end
 	end

 	def over?
 		return self.won? || @board.full?
 	end

 	def won?
 		for combo in WIN_COMBINATIONS do 
 			#compare with index of positions taken in board
 			still_all_in_x = true
 			for position in combo
 				if(@board.cells[position] != "X")
 					still_all_in_x = false
 				end
 			end
 			if still_all_in_x
 				return combo
 			end

 			still_all_in_o = true
 			for position in combo
 				if(@board.cells[position] != "O")
 					still_all_in_o = false
 				end
 			end
 			if still_all_in_o
 				return combo
 			end
		end
		return false
	end
 	
 	def draw?
 		if @board.full? && self.won? == false
 			return true
 		elsif self.won? == true
 			return false
 		end
 	end

 	def winner
 		#player token
 		for combo in WIN_COMBINATIONS do 
 			#compare with index of positions taken in board
 			still_all_in_x = true
 			for position in combo
 				if(@board.cells[position] != "X")
 					still_all_in_x = false
 				end
 			end
 			if still_all_in_x
 				return @board.cells[position]
 			end

 			still_all_in_o = true
 			for position in combo
 				if(@board.cells[position] != "O")
 					still_all_in_o = false
 				end
 			end
 			if still_all_in_o
 				return @board.cells[position]
 			end
		end
		return nil
 	end

 	def turn
		player = current_player
		move = current_player.move(@board)
		
		if @board.valid_move?(move) == true
			@board.update(move, current_player)
		else 
			turn
		end
 	end

 	def play
 			while !self.over?
 				turn
 			end
 	end
end